import 'package:equatable/equatable.dart';
import 'package:foody_flutter/models/menu.dart';

abstract class MenuGetState extends Equatable {
  @override
  List<Object> get props => [];
}

class MenuGetStateSuccess extends MenuGetState {
  final MenuListModel menus;

  MenuGetStateSuccess(this.menus);

  @override
  List<Object> get props => [menus];

  @override
  String toString() => 'MenuGetSuccess: {menus: ${menus}}';
}

class MenuGetStateError extends MenuGetState {
  final String error;

  MenuGetStateError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Menu get error';
}

class MenuGetEmpty extends MenuGetState {
  @override
  String toString() => 'SearchStateEmpty';
}

class GetMenuStateLoading extends MenuGetState {
  @override
  String toString() => 'SearchStateLoading';
}
