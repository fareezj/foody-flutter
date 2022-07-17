import 'package:foody_flutter/models/menu.dart';
import 'package:foody_flutter/services/network_helper.dart';
import 'package:http/http.dart';

class MenuApiService {
  Client client = Client();
  final _baseUrl = "https://foody-app-rn.herokuapp.com/foody";

  Future<MenuListModel> fetchMenuList() async {
    String endpoint = "/getFoodList";
    NetworkHelper networkHelper =
        NetworkHelper('https://foody-app-rn.herokuapp.com/foody/getFoodList');
    Map<String, dynamic> menuList = await networkHelper.getMenu();
    return MenuListModel.fromJson(menuList);
  }
}
