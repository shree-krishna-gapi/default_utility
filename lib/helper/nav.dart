import 'package:flutter/material.dart';
/* Route */
final NavigationService goto = NavigationService();

typedef _RoutePredicate = bool Function(Route<dynamic>);
BuildContext context = NavigationService.defaultKey.currentState!.overlay!.context;

class NavigationService {
  static GlobalKey<NavigatorState> defaultKey = GlobalKey<NavigatorState>();

  Future<T?> pushNamed<T extends Object?>(
      String routeName, {
        Object? args,
      }) async {
    return defaultKey.currentState?.pushNamed<T>(
      routeName,
      arguments: args,
    );
  }

  Future<T?> push<T extends Object?>(Route<T> route) async {
    return defaultKey.currentState?.push<T>(route);
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
      String routeName, {
        Object? args,
        TO? result,
      }) async {
    return defaultKey.currentState?.pushReplacementNamed<T, TO>(
      routeName,
      arguments: args,
      result: result,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
      String routeName, {
        Object? args,
        _RoutePredicate? predicate,
      }) async {
    return defaultKey.currentState?.pushNamedAndRemoveUntil<T>(
      routeName,
      predicate ?? (_) => false,
      arguments: args,
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(
      Route<T> route, {
        _RoutePredicate? predicate,
      }) async {
    return defaultKey.currentState?.pushAndRemoveUntil<T>(
      route,
      predicate ?? (_) => false,
    );
  }

  Future<bool?> maybePop<T extends Object?>([T? result]) async {
    return defaultKey.currentState?.maybePop<T>(result);
  }

  bool canPop() => defaultKey.currentState!.canPop();

  void goBack<T extends Object?>({T? result}) {
    defaultKey.currentState?.pop<T>(result);
  }

  void popUntil(String route) {
    defaultKey.currentState?.popUntil(ModalRoute.withName(route));
  }

  RouteSettings? pageSettings(BuildContext context) {
    return ModalRoute.of<RouteSettings>(context)?.settings;
  }
}
