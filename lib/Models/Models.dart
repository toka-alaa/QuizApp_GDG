class Question {
  String questionText;
  List<Answer> answerText;

  Question(this.questionText, this.answerText);
}

class Answer {
  String text;
  bool isCorrect;

  Answer(this.text, this.isCorrect);
}

List<Question> getquestion() {
  List<Question> list = [];

  list.add(Question('Who is the owner of Flutter ?', [
    Answer('A) Nokia', false),
    Answer('B) Samsung', false),
    Answer('C) Google', true),
    Answer('D) Apple', false),
  ]));

  list.add(Question('Youtube is _______ Platform ?', [
    Answer('A) Music Sharing', false),
    Answer('B) Video Sharing', false),
    Answer('C) Live Streaming', false),
    Answer('D) All of the above', true),
  ]));

  list.add(Question('Who is the owner of Iphone ?', [
    Answer('A) Microsoft', false),
    Answer('B) Apple', true),
    Answer('C) Google', false),
    Answer('D) Oppo', false),
  ]));

  list.add(Question('What does setState() do in Flutter ?', [
    Answer('A) Updates the UI', true),
    Answer('B) Changes the app theme', false),
    Answer('C) Closes the app', false),
    Answer('D) Delete the widget', false),
  ]));

  return list;
}
