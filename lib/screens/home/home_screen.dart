import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody_flutter/bloc/events/menu_event.dart';
import 'package:foody_flutter/bloc/states/menu_state.dart';
import 'package:foody_flutter/models/menu.dart';
import 'package:foody_flutter/screens/home/components/popular_food_item.dart';
import '../../bloc/menu_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MenuBloc _menuBloc;

  @override
  void initState() {
    super.initState();
    _menuBloc = BlocProvider.of<MenuBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _menuBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Foody'),
        ),
        body: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Text(
                'Popular Food',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextButton(
                child: const Text(
                  'Click',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  _menuBloc.add(GetMenus());
                },
              ),
            ]),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BlocBuilder<MenuBloc, MenuGetState>(
                  bloc: BlocProvider.of<MenuBloc>(context),
                  builder: (BuildContext context, MenuGetState state) {
                    if (state is GetMenuStateLoading) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is MenuGetStateError) {
                      return Text(state.error);
                    }
                    if (state is MenuGetStateSuccess) {
                      return _buildPopularFoodList(list: state.menus);
                    }
                    return Text('hello');
                  },
                )
                // StreamBuilder(
                //   stream: _menuBloc.allMenus,
                //   builder: (context, AsyncSnapshot<MenuListModel> snapshot) {
                //     if (snapshot.hasData) {
                //       return _buildPopularFoodList(list: snapshot.data!);
                //     } else if (snapshot.hasError) {
                //       return Text('Errorrr');
                //     }
                //     return const Center(
                //       child: CircularProgressIndicator(),
                //     );
                //   },
                // ),
                )
          ],
        ));
  }
}

Widget _buildPopularFoodList({required MenuListModel list}) {
  return ConstrainedBox(
    constraints: const BoxConstraints(maxHeight: 200.0),
    child: ListView.builder(
        itemCount: list.foodList!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return PopularFoodItem(
              menuId: list.foodList![index].id!,
              menuImage: list.foodList![index].image!,
              menuName: list.foodList![index].name!);
        }),
  );
}
