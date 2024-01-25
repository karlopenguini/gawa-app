import 'package:app/authentication/data/authentication_repository.dart';
import 'package:app/authentication/presentation/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AuthenticatedWidget extends ConsumerWidget {
  final Widget child;
  const AuthenticatedWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.read(authenticationRepositoryProvider);

    if (false) {
      return child;
    } else {
      return const LandingPage();
    }
  }
}
