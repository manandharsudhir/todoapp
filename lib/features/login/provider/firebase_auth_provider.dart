import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/login/repo/firebase_auth_repo.dart';

final userState = StreamProvider((ref) => ref.read(firebaseAuthRepo).user);
