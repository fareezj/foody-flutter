class MenuListModel {
  final List<MenuModel>? foodList;

  MenuListModel({this.foodList});

  factory MenuListModel.fromJson(Map<String, dynamic> parsedJson) {
    var menuListJson = parsedJson['foodList'] as List;
    List<MenuModel> menuList =
        menuListJson.map((e) => MenuModel.fromJson(e)).toList();
    return MenuListModel(foodList: menuList);
  }
}

class MenuModel {
  String? id;
  String? name;
  String? desc;
  String? image;
  String? price;
  String? calories;
  List<String>? ingredients;

  MenuModel(
      {this.id,
      this.name,
      this.desc,
      this.image,
      this.price,
      this.calories,
      this.ingredients});

  factory MenuModel.fromJson(Map<String, dynamic> parsedJson) {
    var ingListJson = parsedJson['ingredients']; // array is now List<dynamic>
    List<String> ingList = List<String>.from(ingListJson);
    return MenuModel(
      id: parsedJson['id'],
      name: parsedJson['name'],
      desc: parsedJson['desc'],
      image: parsedJson['image'],
      price: parsedJson['price'],
      calories: parsedJson['calories'],
      ingredients: ingList,
    );
  }
}
