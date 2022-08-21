import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/app/functions/shared/cache_manager.dart';
import 'package:fruit_market/data/fake_data/fruit_list.dart';
import 'package:fruit_market/data/models/fruit_model.dart';
import 'package:fruit_market/data/models/user_mode.dart';
import 'package:fruit_market/presentation/main/favourite/favourite_view.dart';
import 'package:fruit_market/presentation/main/home/home_view.dart';
import 'package:fruit_market/presentation/main/my_account/my_account.dart';
import 'package:fruit_market/presentation/main/shopping_card/shopping_card_view.dart';

import '../../../../data/models/fruit_type.dart';
import '../../../../presentation/login/login_view.dart';
import 'app_states.dart';
import 'package:fruit_market/data/models/group_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void init() {
    initSett();
    navCurrentScreen = _navItems[navIndex].screen;
    navWidgets = getNavItems();
    fruitTypes = FruitData.fruitTypes;
    groupOfFruits = FruitData.groups;
    currentFruitCard = groupOfFruits[0].list[0];
  }

  // nav bar
  final List<_NavItem> _navItems = [
    _NavItem(icon: Icons.home, label: 'Home', screen: HomeNavView()),
    _NavItem(
        icon: Icons.shopping_cart_outlined,
        label: 'Shopping Card',
        screen: ShoppingCardView()),
    _NavItem(
        icon: Icons.favorite_border,
        label: 'Favourite',
        screen: FavouriteView()),
    _NavItem(
        icon: Icons.person_outline,
        label: 'My Account',
        screen: MyAccountView()),
  ];

  // nav items
  late final List<BottomNavigationBarItem> navWidgets;

  List<BottomNavigationBarItem> getNavItems() {
    print('create List<BottomNavigationBarItem>');
    List<BottomNavigationBarItem> l = [];
    for (var item in _navItems) {
      l.add(BottomNavigationBarItem(icon: Icon(item.icon), label: item.label));
    }
    return l;
  }

  int navIndex = 0;
  late Widget navCurrentScreen;

  void changeNavIndex(int index) {
    navIndex = index;
    navCurrentScreen = _navItems[navIndex].screen;
    emit(AppChangeNavState());
  }

  // ======= home scr ===========

  late List<FruitType> fruitTypes;
  late List<GroupModel> groupOfFruits;
  int indexOfFruitType = 0;

  void changeCoffeeLabelIndex(int index) {
    for (var element in fruitTypes) {
      element.isSelected = false;
    }
    fruitTypes[index].isSelected = true;
    emit(AppChangeFruitTypeState());
  }

  // ======= DETAILS scr ===========
  FruitModel? currentFruitCard;

  // ======= public methods ===========
  void buyNow(FruitModel fruitModel) {
    print("buy : ${fruitModel.name}");
  }

  void addFav(FruitModel fruitModel) {
    print('add Favourite ${fruitModel.name}');
  }

  // setting
  late bool setNotifyAcc;
  late bool setNotifyProm;
  late String selectedLang;
  late String setAddress;
  List<String> langs = ['AR', 'EN', 'FR'];

  // init settings
  void initSett() {
    setNotifyAcc = CacheGet.setNotifyAcc;
    setNotifyProm = CacheGet.setNotifyProm;
    selectedLang = CacheGet.setLang;
    setAddress = CacheGet.setAdr;
  }

  //notify
  void changerNotifyAcc(bool value) {
    setNotifyAcc = value;
    CacheGet.setSetNotifyAcc(setNotifyAcc);
    emit(AppChangeSettingState());
  }

  // prom
  void changerNotifyProm(bool value) {
    setNotifyProm = value;
    CacheGet.setSetNotifyProm(setNotifyProm);
    emit(AppChangeSettingState());
  }
  // lang
  void changeLang(String? value) {
    if (value != null){
      selectedLang = value;
      CacheGet.setSetLang(selectedLang);
      emit(AppChangeSettingState());
    }
  }

  // Address
  void changeAdr(String? value) {
    if (value != null){
      setAddress = value;
      CacheGet.setSetAdr(setAddress);
      emit(AppChangeSettingState());
    }
  }


  // profile
  UserModel user = FruitData.userModel;
}

class _NavItem {
  final IconData icon;
  final String label;
  final Widget screen;

  _NavItem({required this.icon, required this.label, required this.screen});
}
