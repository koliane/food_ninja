import 'package:food_ninja/core/domain/entities/banner/service/banner_service.dart';
import 'package:mobx/mobx.dart';

part 'main_page_state.g.dart';

class _MainPageState extends MainPageState with _$_MainPageState {

}

abstract class MainPageState with Store {
  @observable
  String bannerUrl = '';
  // BaseCollection<>


  factory MainPageState.create() => _MainPageState();
  MainPageState();


  @action
  Future<void> init() async {
    bannerUrl = await const BannerService().getMainBanner();
  }

}