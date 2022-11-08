import 'package:flutter_application_1/data/models/DidYouKnow.dart';
import 'package:flutter_application_1/data/repositories/IDidYouKnowRepo.dart';

class MockDidYouKnowRepo implements IDidYouKnowRepo {
  @override
  List<DidYouKnow> getAllDidYouknow() {
    return [
      DidYouKnow("esme c'est bien"),
      DidYouKnow("esme c'est top"),
      DidYouKnow("esme c'est fantastic"),
      DidYouKnow("esme c'est tres bien"),
      DidYouKnow("esme c'est cool")
    ];
  }
}
