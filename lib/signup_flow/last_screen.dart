import 'package:amplify_test2/models/user.dart';
import 'package:amplify_test2/repositories/auth.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final User? user;
  final AuthRepository authRepo = AuthRepository();
  DashboardScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user?.username == null
                    ? 'Hello, there!'
                    : 'Welcome ${user?.username}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
              ),
              Text(
                user?.email ?? 'email not available',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
              ),
              ElevatedButton.icon(
                onPressed: () => authRepo.signOut(),
                icon: const Icon(Icons.door_back),
                label: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
