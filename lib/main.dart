import 'package:app/authentication/presentation/authenticated_widget.dart';
import 'package:app/common/main_layout.dart';
import 'package:app/firebase_options.dart';
import 'package:app/landing/presentation/pages/landing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(
      child: MaterialApp(
          theme: ThemeData(
            useMaterial3: false,
            textTheme: GoogleFonts.lexendTextTheme(),
          ),
          home: const AuthenticatedWidget(
            child: SafeArea(child: LandingPage()),
          ))));
}
