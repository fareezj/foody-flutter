import 'package:foody_flutter/models/menu.dart';
import 'package:foody_flutter/services/menu_api_service.dart';

class Repository {
  final menuApiService = MenuApiService();

  Future<MenuListModel> fetchAllMenu() => menuApiService.fetchMenuList();
}
