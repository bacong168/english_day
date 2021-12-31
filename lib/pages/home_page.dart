import 'dart:math';

import 'package:english_day/model/english_today.dart';
import 'package:english_day/pages/control_page.dart';
import 'package:english_day/value/app_assest.dart';
import 'package:english_day/value/app_colors.dart';
import 'package:english_day/value/app_style.dart';
import 'package:english_day/widgets/app_buton.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currrenIndex = 0;
  late PageController _pageController;

  List<EnglishToday> words = [];

  List<int> fixedListRandom({int len = 1, int max = 120, min = 1}) {
    if (len > max || len < min) {
      return [];
    }
    List<int> newList = [];
    Random random = new Random();

    int count = 1;
    while (count <= len) {
      int val = random.nextInt(max);
      if (newList.contains(val)) {
        continue;
      } else {
        newList.add(val);
        count++;
      }
    }
    return newList;
  }

  getEnglishToday() {
    List<String> newList = [];
    List<int> rans = fixedListRandom(len: 5, max: nouns.length);
    rans.forEach((index) {
      newList.add(nouns[index]);
    });

    words = newList
        .map((e) => EnglishToday(
              noun: e,
            ))
        .toList();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    getEnglishToday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0, //đường thẳng dướu appbar
        title: Text(
          'English today',
          style: AppStyle.h4.copyWith(color: AppColors.textColor),
        ),
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Image.asset(AppAssets.menu),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
                height: size.height * 1 / 10,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.centerLeft,
                child: Text(
                  '"It is amazilong how complete is the delusion that beauty is gooddress"',
                  style: AppStyle.h5
                      .copyWith(fontSize: 15, color: AppColors.textColor),
                )),
            Container(
              height: size.height * 2 / 3,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currrenIndex = index;
                    });
                  },
                  itemCount: words.length,
                  itemBuilder: (context, index) {
                    String firstLetter =
                        words[index].noun != null ? words[index].noun! : '';
                    firstLetter = firstLetter.substring(0, 1).toUpperCase();

                    String leftLetter =
                        words[index].noun != null ? words[index].noun! : '';
                    leftLetter = leftLetter.substring(1, leftLetter.length);
                    return Container(
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(3, 6),
                              blurRadius: 6)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.all(16),
                              child: Image.asset(
                                AppAssets.heart,
                                height: 42,
                                width: 42,
                              ),
                            ),
                            RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    text: firstLetter,
                                    style: TextStyle(
                                        fontSize: 98,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(3, 6))
                                        ]),
                                    children: [
                                      TextSpan(
                                        text: leftLetter.toLowerCase(),
                                        style: TextStyle(
                                            fontSize: 78,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              BoxShadow(
                                                  color: Colors.black38,
                                                  offset: Offset(3, 6))
                                            ]),
                                      ),
                                    ])),
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: Text(
                                '"Think of all the beauty still left around you and be happy."',
                                style: AppStyle.h4.copyWith(
                                    letterSpacing: 1,
                                    color: Colors.white,
                                    wordSpacing: 7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),

            //Indicator
            Container(
              height: 12,
              margin: const EdgeInsets.only(top: 15),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(), //Set cố định
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return buildIndicator(index == _currrenIndex, size);
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            print("EX CHANGE");
          },
          child: Image.asset(AppAssets.exchange3x),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: AppColors.lightBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 24),
                child: Text(
                  'You mind',
                  style: AppStyle.h3.copyWith(color: AppColors.textColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: AppButon(
                    label: 'Favotites',
                    Ontap: () {
                      print("Favotites");
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: AppButon(
                    label: 'You control',
                    Ontap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ControlPage()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: isActive ? size.width * 1 / 5 : 24, //? == TRUE, : FAIL
      decoration: BoxDecoration(
          color: isActive ? AppColors.lightBlue : AppColors.lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
                color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
          ]),
    );
  }
}
