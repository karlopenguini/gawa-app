import 'package:app/authentication/data/authentication_repository.dart';
import 'package:app/authentication/presentation/controller/authentication_controller.dart';
import 'package:app/authentication/presentation/pages/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AuthenticatedWidget extends ConsumerWidget {
  final Widget child;
  const AuthenticatedWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(isAuthenticated);
    var notifier = ref.read(authenticationRepositoryProvider);

    if (true) {
      return child;
    } else {
      return LandingPage();
    }
  }
}
