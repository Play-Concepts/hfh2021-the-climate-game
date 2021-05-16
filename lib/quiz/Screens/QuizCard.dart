import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:climategame/quiz/Screens/QuizResult.dart';
import 'package:climategame/quiz/utils/QuizCard.dart';
import 'package:climategame/quiz/utils/QuizColors.dart';
import 'package:climategame/quiz/utils/QuizConstant.dart';
import 'package:climategame/utils/styles.dart';

class QuizCards extends StatefulWidget {
  static String tag = '/QuizCards';

  @override
  _QuizCardsState createState() => _QuizCardsState();
}

class _QuizCardsState extends State<QuizCards> {
  late List<Widget> cardList;

  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    cardList = _generateCards();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: quiz_app_background,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                child: Stack(alignment: Alignment.center, children: cardList),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        finish(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: quiz_colorPrimary,
                      ),
                    ),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.5,
                        backgroundColor: textSecondaryColor.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          quiz_green,
                        ),
                      ).paddingAll(16),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  List<Widget> _generateCards() {
    List<Quiz> planetCard = List.empty(growable: true);
    planetCard.add(
      Quiz(
          "How does the\ngreenhouse effect\nwork?",
          "By reflecting the sun's energy,\n causing it to warm the\nEarth",
          "By absorbing the sun's energy,\n slowing or preventing heat\nfrom escaping into space",
          "By directly warming oceans\nand causing dramatic weather",
          "By being absorbed by oceans,\nin turn causing the Earth's\ntemperature to rise", 50.0),
    );
    planetCard.add(
      Quiz("Which is the most\npotent greenhouse\ngas? ", "Fluorinated gases", "Carbon dioxide", "Nitrous oxide", "Methane", 70.0),
    );
    planetCard.add(
        Quiz("How much have sea\nlevels risen in\nthe last century?",
            "7 inches", "2 inches", "5 inches", "16 inches", 90.0));

    planetCard.add(
        Quiz(
            "What does carbon\nintensity measure?",
            "CO2 per \$ GDP",
            "CO2 per KWh",
            "CO2 per electrical charge",
            "CO2 per BTU energy",
            110.0));
    planetCard.add(
      Quiz(
          "Which state has the\n highest energy\n related CO2 emissions\n per capita?",
          "Florida", "Wyoming", "North Dakota", "California", 130.0),
    );
    List<Widget> cardList = List.empty(growable: true);

    for (int x = 0; x < 5; x++) {
      cardList.add(
        Positioned(
          top: planetCard[x].topMargin,
          child: Draggable(
              onDragEnd: (drag) {
                if (x == 0) {
                  setState(() {
                    QuizResult().launch(context);
                  });
                }
                removeCards(x);
              },
              childWhenDragging: Container(),
              feedback: Material(
                child: GestureDetector(
                  child: Container(
                    decoration: boxDecorations(radius: 20, bgColor: quiz_white, showShadow: true),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200.0,
                          width: 320.0,
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                            child: text(planetCard[x].cardImage, fontSize: textSizeLarge, fontFamily: fontBold, isLongText: true),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Column(
                              children: <Widget>[
                                quizCardSelection("A.", planetCard[x].option1, () {
                                  removeCards(x);
                                }),
                                quizCardSelection("B.", planetCard[x].option2, () {
                                  removeCards(x);
                                }),
                                quizCardSelection("C.", planetCard[x].option3, () {
                                  removeCards(x);
                                }),
                                quizCardSelection("D.", planetCard[x].option4, () {
                                  removeCards(x);
                                }),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              child: GestureDetector(
                child: Container(
                    decoration: boxDecorations(radius: 20, bgColor: quiz_white, showShadow: true),
                    child: Column(
                      children: <Widget>[
                        Container(
                            height: 200.0,
                            width: 320.0,
                            child: Container(
                              margin: EdgeInsets.only(top: 50),
                              padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                              child: text(planetCard[x].cardImage, fontSize: textSizeLarge, fontFamily: fontBold, isLongText: true),
                            )),
                        Container(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Column(
                              children: <Widget>[
                                quizCardSelection("A.", planetCard[x].option1, () {
                                  removeCards(x);
                                }),
                                quizCardSelection("B.", planetCard[x].option2, () {
                                  removeCards(x);
                                }),
                                quizCardSelection("C.", planetCard[x].option3, () {
                                  removeCards(x);
                                }),
                                quizCardSelection("D.", planetCard[x].option4, () {
                                  removeCards(x);
                                }),
                              ],
                            ))
                      ],
                    )),
              )),
        ),
      );
    }
    return cardList;
  }
}

Widget quizCardSelection(var option, var option1, onPressed) {
  return InkWell(
    onTap: () {
      onPressed();
    },
    child: Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: boxDecorations(showShadow: false, bgColor: quiz_edit_background, radius: 10, color: quiz_view_color),
      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      width: 320,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: text(option1, textColor: quiz_textColorSecondary),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: text(option, textColor: quiz_textColorSecondary),
          )
        ],
      ),
    ),
  );
}
