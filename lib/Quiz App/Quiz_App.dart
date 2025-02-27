import 'package:flutter/material.dart';
import 'package:quiz_app/Models/Models.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int score = 0 ;
  int currentIndex = 0;
  Answer? selectAnswer ;
  List<Question> questionList = getquestion();


  void nextQuestion() {
    if (selectAnswer != null) {
      if (selectAnswer!.isCorrect) {
        score++;
      }

      if (currentIndex < questionList.length - 1) {
        setState(() {
          currentIndex++;
          selectAnswer = null;
        });
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Quiz Completed!",
              style: TextStyle(
                fontSize: 30 ,
                fontStyle:  FontStyle.italic,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),),
            content: Text("Your score is $score / ${questionList.length}",
              style: TextStyle(
                fontSize: 20 ,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                    score = 0;
                    selectAnswer = null;
                  });
                  Navigator.pop(context);
                },
                child: Text("Restart",
                  style: TextStyle(
                    color: Colors.black,
                  ),),
              ),
            ],
          ),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Simple Quiz App",
          style: TextStyle(
            fontSize: 30 ,
            fontStyle:  FontStyle.italic,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),),
          Row(
            children: [
              Text("Question ${currentIndex +1 } / ${questionList.length} ",
                style: TextStyle(
                  fontSize: 25 ,
                  fontStyle:  FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Text(questionList[currentIndex].questionText,style: TextStyle(
                  fontSize: 18,
                    fontWeight: FontWeight.w500
                ),),
              ),
              Positioned(
                top:15 ,
                left: -20,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                ),
              ),
              Positioned(
                top:15 ,
                right: -20,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                ),
              ),
              Positioned(
                top:-35 ,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: Icon(Icons.check,color: Colors.green,size: 35,),
                ),
              )
            ],
          ),
          for (Answer answer in questionList[currentIndex].answerText)
            ElevatedButton(
             style : ElevatedButton.styleFrom(
               minimumSize: Size(300, 70),
               backgroundColor: selectAnswer == answer ? Colors.orange : Colors.white
             ) ,
              onPressed: (){
               setState(() {
                 selectAnswer = answer;
               });
              },
                child: Text(answer.text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),),),

          ElevatedButton(
            onPressed: nextQuestion,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 50),
            ),
            child: Text(
              currentIndex == questionList.length - 1 ? "Submit" : "Next",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}