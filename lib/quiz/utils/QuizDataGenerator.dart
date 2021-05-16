import 'package:climategame/quiz/model/QuizModels.dart';
import 'package:climategame/quiz/utils/QuizImages.dart';

List<NewQuizModel> getQuizData() {
  List<NewQuizModel> list = List<NewQuizModel>.empty(growable: true);
  NewQuizModel model1 = NewQuizModel();
  model1.quizName = "Effects of Climate Change";
  model1.totalQuiz = "4 Quizzes";
  model1.quizImage = quiz_ic_study1;

  NewQuizModel model2 = NewQuizModel();
  model2.quizName = "Non-fossil Fuels";
  model2.totalQuiz = "2 Quizzes";
  model2.quizImage = quiz_ic_study2;

  list.add(model1);
  list.add(model2);

  return list;
}

List<QuizTestModel> quizGetData(String quizName) {
  if (quizName == "Effects of Climate Change") return _quizGetData1();
  return _quizGetData2();
}

List<QuizTestModel> _quizGetData1() {
  List<QuizTestModel> list = List<QuizTestModel>.empty(growable: true);
  QuizTestModel model1 = QuizTestModel();
  model1.heading = "Earth Day Quiz";
  model1.image = quiz_ic_quiz1;
  model1.type = "Special Event";
  model1.description = "Let celebrate Earth Day!.";
  model1.status = "true";

  QuizTestModel model2 = QuizTestModel();
  model2.heading = "Your Climate Change IQ";
  model2.image = quiz_ic_quiz2;
  model2.type = "Quiz";
  model2.description = "Test your true knowledge of climate change issues.";
  model2.status = "false";

  QuizTestModel model3 = QuizTestModel();
  model3.heading = "WWF Earth Hour";
  model3.image = quiz_ic_quiz1;
  model3.type = "Special Event";
  model3.description = "World Wildlife Fund's Special Event of the Year!";
  model3.status = "false";

  QuizTestModel model4 = QuizTestModel();
  model4.heading = "FT Climate Change Quiz";
  model4.image = quiz_ic_quiz2;
  model4.type = "Quiz";
  model4.description = "The Financial Times impact analysis of Climate Change.";
  model4.status = "false";

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);

  return list;
}

List<QuizTestModel> _quizGetData2() {
  List<QuizTestModel> list = List<QuizTestModel>.empty(growable: true);
  QuizTestModel model1 = QuizTestModel();
  model1.heading = "Types of Non-fossil Fuels";
  model1.image = quiz_ic_quiz1;
  model1.type = "Quiz";
  model1.description = "And how much will it cost?";
  model1.status = "true";

  QuizTestModel model2 = QuizTestModel();
  model2.heading = "Nuclear Energy";
  model2.image = quiz_ic_quiz2;
  model2.type = "Flashcards";
  model2.description = "Does it really work? Is it safe?";
  model2.status = "false";

  list.add(model1);
  list.add(model2);

  return list;
}

List<QuizBadgesModel> quizBadgesData() {
  List<QuizBadgesModel> list = List<QuizBadgesModel>.empty(growable: true);
  QuizBadgesModel model1 = QuizBadgesModel();
  model1.title = "Achiever";
  model1.subtitle = "Complete an exercise";
  model1.img = quiz_ic_list2;

  QuizBadgesModel model2 = QuizBadgesModel();
  model2.title = "Perfectionist";
  model2.subtitle = "Finish All lesson of chapter";
  model2.img = quiz_ic_list5;

  QuizBadgesModel model3 = QuizBadgesModel();
  model3.title = "Scholar";
  model3.subtitle = "Study two courses";
  model3.img = quiz_ic_list3;

  QuizBadgesModel model4 = QuizBadgesModel();
  model4.title = "Champion";
  model4.subtitle = "Finish #1 in Scoreboard";
  model4.img = quiz_ic_list4;

  QuizBadgesModel model5 = QuizBadgesModel();
  model5.title = "Focused";
  model5.subtitle = "Study every day for 30 days";
  model5.img = quiz_ic_list5;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  list.add(model4);
  list.add(model5);

  return list;
}

List<QuizScoresModel> quizScoresData() {
  List<QuizScoresModel> list = List<QuizScoresModel>.empty(growable: true);
  QuizScoresModel model1 = QuizScoresModel();
  model1.title = "Effects of Climate Change";
  model1.totalQuiz = "4 Quizzes";
  model1.img = quiz_ic_course1;
  model1.scores = "30/50";

  QuizScoresModel model2 = QuizScoresModel();
  model2.title = "Non-fossil Fuels";
  model2.totalQuiz = "2 Quizzes";
  model2.img = quiz_ic_course2;
  model2.scores = "40/50";

  list.add(model1);
  list.add(model2);

  return list;
}

List<QuizContactUsModel> quizContactUsData() {
  List<QuizContactUsModel> list = List<QuizContactUsModel>.empty(growable: true);
  QuizContactUsModel model1 = QuizContactUsModel();
  model1.title = "Call Request";
  model1.subtitle = "+00 356 646 234";

  QuizContactUsModel model2 = QuizContactUsModel();
  model2.title = "Email";
  model2.subtitle = "Response within 24 business hours";

  list.add(model1);
  list.add(model2);

  return list;
}
