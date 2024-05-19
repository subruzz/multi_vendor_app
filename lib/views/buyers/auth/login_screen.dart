import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mutli_vendor_app/controllers/auth_controller.dart';
import 'package:mutli_vendor_app/utils/show_snackbar.dart';
import 'package:mutli_vendor_app/views/buyers/auth/register_screen.dart';
import 'package:mutli_vendor_app/views/buyers/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  void _signInUser(BuildContext context) async {
    final res = await AuthController.loginUser(email, password);
    if (context.mounted) {
      if (res != 'success') {
        showSnack(res, context);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login To Customer\'s Account',
                style: TextStyle(fontSize: 18)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) => email = value,
                decoration: const InputDecoration(label: Text('Enter E-mail')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) => password = value,
                decoration:
                    const InputDecoration(label: Text('Enter Password')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade900,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    _signInUser(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, letterSpacing: 2),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
