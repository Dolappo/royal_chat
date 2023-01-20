// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart';
import 'package:royal_chat/ui/Screens/chat_feature/chat_screen.dart' as _i5;
import 'package:royal_chat/ui/Screens/chat_feature/preview_image_screen.dart'
    as _i7;
import 'package:royal_chat/ui/Screens/Login_screen.dart' as _i3;
import 'package:royal_chat/ui/Screens/sign_up_screen.dart' as _i4;
import 'package:royal_chat/ui/Screens/signlog_screen.dart' as _i6;
import 'package:royal_chat/ui/Screens/welcome_screen.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const welcomeScreen = '/';

  static const loginScreen = '/login-screen';

  static const signUpScreen = '/sign-up-screen';

  static const chatScreen = '/chat-screen';

  static const decisionScreen = '/decision-screen';

  static const previewSelectedImage = '/preview-selected-image';

  static const all = <String>{
    welcomeScreen,
    loginScreen,
    signUpScreen,
    chatScreen,
    decisionScreen,
    previewSelectedImage,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.welcomeScreen,
      page: _i2.WelcomeScreen,
    ),
    _i1.RouteDef(
      Routes.loginScreen,
      page: _i3.LoginScreen,
    ),
    _i1.RouteDef(
      Routes.signUpScreen,
      page: _i4.SignUpScreen,
    ),
    _i1.RouteDef(
      Routes.chatScreen,
      page: _i5.ChatScreen,
    ),
    _i1.RouteDef(
      Routes.decisionScreen,
      page: _i6.DecisionScreen,
    ),
    _i1.RouteDef(
      Routes.previewSelectedImage,
      page: _i7.PreviewSelectedImage,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.WelcomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i2.WelcomeScreen(),
        settings: data,
      );
    },
    _i3.LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i3.LoginScreen(),
        settings: data,
      );
    },
    _i4.SignUpScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i4.SignUpScreen(),
        settings: data,
      );
    },
    _i5.ChatScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i5.ChatScreen(),
        settings: data,
      );
    },
    _i6.DecisionScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i6.DecisionScreen(),
        settings: data,
      );
    },
    _i7.PreviewSelectedImage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.PreviewSelectedImage(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToWelcomeScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.welcomeScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDecisionScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.decisionScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPreviewSelectedImage([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.previewSelectedImage,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
