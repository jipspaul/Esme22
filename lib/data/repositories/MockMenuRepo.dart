import '../models/MenuItem.dart';
import 'IMenuRepo.dart';

class MockMenuRepo implements IMenuRepo {
  @override
  List<MenuItemModel> getMenu() {
    return [
      MenuItemModel("Quizz", "/quizz"),
      MenuItemModel("Map", "/maps"),
      MenuItemModel("Envoyer", "/EnvoyerQuizz"),
      MenuItemModel("Recevoir", "/receptionquizzScreen"),
    ];
  }
}
