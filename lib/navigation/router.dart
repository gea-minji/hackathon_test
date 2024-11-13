import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon_sample/screen/home_screen.dart';
import 'package:hackathon_sample/screen/text_input_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
const _transitionKey = ValueKey<String>("TransitionKey");

final routerProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: '/textInputScreen',
        name: 'textInputScreen',
        builder: (context, state) => TextInputScreen())
  ]);

  return router;
});
