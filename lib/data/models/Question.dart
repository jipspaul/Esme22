class Question {
  final String question; //ex: Which country?
  final data;
  final QuestionType type;
  final Map<String, bool> responses;

  Question(this.question, this.data, this.type, this.responses);
}

enum QuestionType { IMAGE, TEXT, AUDIO, VIDEO }
