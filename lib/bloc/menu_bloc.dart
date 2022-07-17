import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody_flutter/bloc/events/menu_event.dart';
import 'package:foody_flutter/bloc/states/menu_state.dart';
import 'package:foody_flutter/models/menu.dart';
import 'package:foody_flutter/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MenuBloc extends Bloc<MenuGetEvent, MenuGetState> {
  final Repository repository;
  final _menuFetcher = PublishSubject<MenuListModel>();
  final _popularMenuFetcher = PublishSubject<List<MenuModel>>();

  MenuBloc({required this.repository}) : super(MenuGetEmpty()) {
    on<GetMenus>((event, emit) => _onGetAllMenus(event, emit));
  }

  Stream<MenuListModel> get allMenus => _menuFetcher.stream;
  Stream<List<MenuModel>> get popularMenus => _popularMenuFetcher.stream;

  fetchAllMenus() async {
    MenuListModel menuModel = await repository.fetchAllMenu();
    _menuFetcher.sink.add(menuModel);
    _popularMenuFetcher.sink.add(menuModel.foodList!);
  }

  void _onGetAllMenus(event, emit) async {
    emit(GetMenuStateLoading());
    try {
      MenuListModel result = await repository.fetchAllMenu();
      emit(MenuGetStateSuccess(result));
    } catch (e) {
      emit(MenuGetStateError(e.toString()));
    }
  }

  dispose() {
    _menuFetcher.close();
  }
}
