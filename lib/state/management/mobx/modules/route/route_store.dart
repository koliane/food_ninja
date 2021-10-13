import 'package:mobx/mobx.dart';
import 'package:food_ninja/state/management/mobx/modules/route/internals/base_route_actions.dart';
import 'package:food_ninja/state/management/mobx/modules/route/internals/route_action.dart';
import 'package:food_ninja/state/management/mobx/modules/route/internals/route_action_enum.dart';
import 'package:food_ninja/state/routes/routes.dart';

part 'route_store.g.dart';

class RouteStore = _RouteStore with _$RouteStore;

abstract class _RouteStore with Store, BaseRouteActions {
  @observable
  RouteAction currentRoute = RouteAction(name: Routes.main, action: RouteActionEnum.init);

}