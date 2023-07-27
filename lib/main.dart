import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/login/provider/firebase_auth_provider.dart';

import 'features/login/view/login_view.dart';
import 'features/splash/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final themeData = ref.watch(themeProvider);
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData.dark(useMaterial3: true),
    );
  }
}

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userState);
    return Scaffold(
      body: user.when(data: (data) {
        return Center(child: Text(data?.email ?? "NO user"));
      }, error: (e, st) {
        return Center(child: Text(e.toString()));
      }, loading: () {
        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}

// final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

// final themeProvider =
//     StateNotifierProvider<ThemeProvider, ThemeMode>((ref) => ThemeProvider());

// class ThemeProvider extends StateNotifier<ThemeMode> {
//   ThemeProvider() : super(ThemeMode.light);
//   changeTheme() {
//     if (state == ThemeMode.light) {
//       state = ThemeMode.dark;
//     } else {
//       state = ThemeMode.light;
//     }
//   }
// }

// final themeProvider = ChangeNotifierProvider((ref) => ThemeProvider());

// class ThemeProvider extends ChangeNotifier {
//   ThemeMode themeMode = ThemeMode.light;

//   changeTheme() {
//     if (themeMode == ThemeMode.light) {
//       themeMode = ThemeMode.dark;
//     } else {
//       themeMode = ThemeMode.light;
//     }
//     notifyListeners();
//   }
// }

final exampleOfFutureProvider = FutureProvider<String>((ref) async {
  await Future.delayed(Duration(seconds: 3));
  return "This is Data";
});
