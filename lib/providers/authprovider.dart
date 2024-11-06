import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshopapp/services/authservice.dart';

final authProvider = Provider<Authservice>((ref) {
  return Authservice();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authProvider).authStatechange;
});
