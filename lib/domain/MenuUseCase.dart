import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/ui/QuizzScreen.dart';

import '../data/models/MenuItem.dart';
import '../data/repositories/IMenuRepo.dart';
import '../data/repositories/MockMenuRepo.dart';

class MenuUseCase {
  List<MenuItemModel> getMenu() {
    IMenuRepo repo = MockMenuRepo();
    var menu = repo.getMenu().sublist(0, 4);
    return menu;
  }
}
