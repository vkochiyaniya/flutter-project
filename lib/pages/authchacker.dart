import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshopapp/pages/errorscreen.dart';
import 'package:pshopapp/pages/home.dart';
import 'package:pshopapp/pages/loadingScreen.dart';
import 'package:pshopapp/pages/signin.dart';
import 'package:pshopapp/providers/authprovider.dart';

class AuthChecker extends ConsumerWidget {
  AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authStateProvider);
    return _authState.when(
        data: (data) {
          if (data != null) return Home();
          return SignIn();
        },
        error: (e, trace) => ErrorScereen(
              e: e,
              trace: trace,
            ),
        loading: () => Loadingscreen());
  }
}
