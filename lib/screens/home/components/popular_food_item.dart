import 'package:flutter/material.dart';

class PopularFoodItem extends StatelessWidget {
  final String menuId;
  final String menuName;
  final String menuImage;

  const PopularFoodItem(
      {Key? key,
      required this.menuId,
      required this.menuImage,
      required this.menuName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: GestureDetector(
        onTap: () {
          print('jello');
        },
        child: Container(
          constraints: const BoxConstraints(maxWidth: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                menuImage,
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
              Text(menuName)
            ],
          ),
        ),
      ),
    );
  }
}
