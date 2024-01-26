import 'package:flutter/material.dart';
import 'package:forumapp/views/widgets/input_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Page',
                style: GoogleFonts.poppins(fontSize: 30)
              ),
              const SizedBox(
                height: 30,
              ),
              InputWidget(
                hintText: "Email",
                controller: _emailController,
                obscureText: false,
              ),
              const SizedBox(
                height: 30,
              ),
              InputWidget(
                hintText: "PassWord",
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('Login', style: GoogleFonts.poppins(
                  fontSize: 18
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
