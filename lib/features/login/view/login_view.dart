import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/login/repo/firebase_auth_repo.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final formKey = GlobalKey<FormState>();
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                  ),
                  controller: emailCon,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required field';
                    } else if (!(value!.contains("@"))) {
                      return "Please enter an email";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "password",
                  ),
                  controller: passwordCon,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required field';
                    } else if ((value.length < 8)) {
                      return "Enter strong password";
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                TextButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        final response = await ref
                            .read(firebaseAuthRepo)
                            .loginUser(
                                emailCon.text.trim(), passwordCon.text.trim());
                        if (response == "Login Successful") {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(response)));
                        } else {
                          await ref.read(firebaseAuthRepo).registerUser(
                              emailCon.text.trim(), passwordCon.text.trim());
                        }
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    child: Text("lOGIN")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
