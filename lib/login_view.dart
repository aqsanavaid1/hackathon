import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mid/HomeScreen.dart';
import 'package:mid/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen( {Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailControllerLogin = TextEditingController();
  final TextEditingController passwordControllerLogin = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailControllerLogin.text,
        password: passwordControllerLogin.text,
      );
      final User? user = credential.user;
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  homeScreen()),
        );
      } else {
        // Handle authentication error (user is null).
        print('Error: User is null');
      }
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException errors (e.g., invalid email or password).
      print('Error: ${e.message}');
    } catch (e) {
      // Handle other errors.
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Color(0xffEB3738),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 7,
                    color: Colors.grey,
                    spreadRadius: 2,
                  ),
                ],
              ),
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailControllerLogin,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordControllerLogin,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: signInWithEmailAndPassword,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xffEB3738),
                        ),
                      ),
                      child: const Text("SIGN IN"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 150,
            child: Image.asset(
              'assets/icon.png',
              height: 100,
              width: 100,
            ),
          ),
          Positioned(
            top: 700,
            left: 80,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              child: const Text(
                "Don't have an account? Register now",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
