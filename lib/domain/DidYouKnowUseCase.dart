import 'package:flutter_application_1/data/repositories/IDidYouKnowRepo.dart';
import 'package:flutter_application_1/data/repositories/MockDidYouKnowRepo.dart';

class DidYouKnowUseCase {
  String getTodayDidYouKnow() {
    IDidYouKnowRepo repo = MockDidYouKnowRepo();
    var allDYK = repo.getAllDidYouknow();
    return allDYK.first.text;
  }
}
