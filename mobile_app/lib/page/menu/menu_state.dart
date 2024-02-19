part of 'menu_cubit.dart';

abstract class MenuState extends Equatable {
  MenuState(this.index);

  final int index;

}

class MenuInitial extends MenuState {

  MenuInitial() : super(0);

  @override
  List<Object> get props => [];
}

class MenuCardSets extends MenuState {
  MenuCardSets() : super(1);

  @override
  List<Object> get props => [];
}
