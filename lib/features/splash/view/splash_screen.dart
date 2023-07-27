import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/login/view/login_view.dart';
import 'package:todoapp/main.dart';

import '../../login/provider/firebase_auth_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userState);
    return Scaffold(
      body: user.when(data: (data) {
        if (data != null) {
          return Homepage();
        } else {
          return LoginView();
        }
      }, error: (e, st) {
        return Center(
          child: Text(e.toString()),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
