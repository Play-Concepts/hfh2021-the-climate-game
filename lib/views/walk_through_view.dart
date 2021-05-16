import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:climategame/utils/colors.dart';
import 'package:climategame/utils/styles.dart';
import 'package:climategame/views/login_view.dart';

class WalkThroughView extends StatefulWidget {
  @override
  _WalkThroughViewState createState() => _WalkThroughViewState();
}

class _WalkThroughViewState extends State<WalkThroughView> {
  late bool isActive;
  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;

  List<Widget> buildDotIndicator() {
    List<Widget> list = [];
    for (int i = 0; i <= 2; i++) {
      list.add(i == pageChanged
          ? sDDotIndicator(isActive: true)
          : sDDotIndicator(isActive: false));
    }

    return list;
  }

  Widget sDDotIndicator({bool isActive = false}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 8.0 : 6.0,
      width: isActive ? 8.0 : 6.0,
      decoration: BoxDecoration(
        color: isActive ? cPrimaryColor : Color(0xFF7E869B),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: size.height * 0.7,
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    pageChanged = index;
                  });
                },
                controller: pageController,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.1, left: 10, right: 10),
                        child: Image(
                          image:
                              AssetImage('assets/images/sduser.png'),
                          height: size.height * 0.3,
                          width: size.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text('Learn about Climate Change',
                              textAlign: TextAlign.center,
                              style: boldTextStyle(size: 25)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Text(
                            'Through Quizzes and Fun Factoids.',
                            textAlign: TextAlign.justify,
                            style: secondaryTextStyle(size: 16)),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.1, left: 10, right: 10),
                        child: Image(
                          image: AssetImage(
                              'assets/images/sdreport.png'),
                          height: size.height * 0.3,
                          width: size.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text('Progress Reports',
                              textAlign: TextAlign.center,
                              style: boldTextStyle(size: 25)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Text(
                            'Track the Scores of your wards.',
                            textAlign: TextAlign.justify,
                            style: secondaryTextStyle(size: 16)),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.1, left: 10, right: 10),
                        child: Image(
                          image:
                              AssetImage('assets/images/privacy.png'),
                          height: size.height * 0.3,
                          width: size.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text('Privacy Protected',
                              textAlign: TextAlign.center,
                              style: boldTextStyle(size: 25)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Text(
                            'The Climate Game is built with HAT Platform Technology. All Scores and Activities are stored on your own Personal Data Account.',
                            textAlign: TextAlign.justify,
                            style: secondaryTextStyle(size: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildDotIndicator(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  pageChanged != 2
                      ? InkWell(
                          child: CircleAvatar(
                            radius: 25,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            backgroundColor: cPrimaryColor,
                          ),
                          onTap: () {
                            pageController.nextPage(
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeInOut);
                          },
                        )
                      : Container(
                          margin:
                              EdgeInsets.only(bottom: 0, left: 20, right: 20),
                          width: size.width,
                          height: 50,
                          child: RaisedButton(
                            color: cPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 1,
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ),
                              );
                            },
                            child: Text(
                              "GET STARTED",
                              textAlign: TextAlign.center,
                              style: boldTextStyle(
                                  size: 16,
                                  textColor: Colors.white,
                                  letterSpacing: 2),
                            ),
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
