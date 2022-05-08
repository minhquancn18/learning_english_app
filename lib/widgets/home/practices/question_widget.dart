// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learning_english_app/providers/pratice/page_quiz_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/answer.dart';
import '../../../models/quiz.dart';
import '../../../utils/constants.dart';
import '../../body_practice.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  bool isListeningTest(PracticeType practiceType) {
    if (practiceType == PracticeType.listening) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    PageQuizProvider pageQuizProvider = Provider.of<PageQuizProvider>(context);

    final Quiz quiz = pageQuizProvider.listQuiz[index];
    List<Answer> answerList = quiz.listAnswer!;

    return Column(
      children: [
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
              child: Column(children: [
            quiz.imageUrl!.isEmpty
                ? SizedBox()
                : CustomPicture(imageUrl: quiz.imageUrl!),
            quiz.script!.isEmpty
                ? SizedBox()
                : CustomPicture(imageUrl: quiz.script!),
            quiz.script1!.isEmpty
                ? SizedBox()
                : CustomPicture(imageUrl: quiz.script1!),
            quiz.script2!.isEmpty
                ? SizedBox()
                : CustomPicture(imageUrl: quiz.script2!),
            for (Answer answer in answerList)
              ExpansionPanelCustomAnswers(answer: answer)
          ])),
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: kDefaultBorderRadius,
                        topRight: kDefaultBorderRadius)),
                child: Column(
                  children: [
                    // isListeningTest(_pageQuizProvider
                    //         .practiceFile.practice.practiceType)
                    //     // true
                    //     ? AudioPlayerWidget(
                    //         audioUrl: ,
                    //         isRemote: true)
                    //     : SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.arrow_back)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.wb_incandescent_outlined)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.error_outline)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.arrow_forward)),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
