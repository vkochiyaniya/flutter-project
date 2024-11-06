import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshopapp/pages/authchacker.dart';
import 'package:pshopapp/pages/errorscreen.dart';
import 'package:pshopapp/pages/loadingScreen.dart';

void main() {
  runApp(
    ProviderScope(child: MyApp()),
  );
}

final firebaseinitializerProvider = FutureProvider<FirebaseApp>(
  (ref) async {
    return await Firebase.initializeApp();
  },
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final intialize = ref.watch(firebaseinitializerProvider);
    return MaterialApp(
      title: 'Plant Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: intialize.when(
        data: (data) {
          return AuthChecker();
        },
        error: (e, StackTrace) => ErrorScereen(e: e, trace: StackTrace),
        loading: () => Loadingscreen(),
      ),
    );
  }
}


