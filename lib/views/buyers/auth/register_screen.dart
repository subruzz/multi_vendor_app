import 'package:flutter/material.dart';
import 'package:mutli_vendor_app/controllers/auth_controller.dart';
import 'package:mutli_vendor_app/utils/show_snackbar.dart';
import 'package:mutli_vendor_app/views/buyers/auth/login_screen.dart';
import 'package:mutli_vendor_app/views/buyers/main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String fullName = '';

  String email = '';

  String phoneNumber = '';

  String password = '';

  void _signUpUser(BuildContext context) async {
    final res =
        await AuthController.signUpUser(email, fullName, phoneNumber, password);
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
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Create Customer\'s Account',
                style: TextStyle(fontSize: 18)),
            CircleAvatar(radius: 64, backgroundColor: Colors.yellow.shade900),
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
                onChanged: (value) => fullName = value,
                decoration:
                    const InputDecoration(label: Text('Enter Full Name')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) => phoneNumber = value,
                decoration:
                    const InputDecoration(label: Text('Enter Phone No')),
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
                    _signUpUser(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'REGISTER',
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
                  'Already have an account?',
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('LOGIN', style: TextStyle(fontSize: 18)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
