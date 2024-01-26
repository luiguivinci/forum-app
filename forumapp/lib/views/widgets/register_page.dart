import 'package:flutter/material.dart';
import 'package:forumapp/controllers/authentication.dart';
import 'package:forumapp/views/login_page.dart';
import 'package:forumapp/views/widgets/input_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Register Page', style: GoogleFonts.poppins(fontSize: 30)),
              const SizedBox(height: 30),
              InputWidget(
                hintText: "Name",
                controller: _nameController,
                obscureText: false,
              ),
              const SizedBox(height: 30),
              InputWidget(
                hintText: "Username",
                controller: _usernameController,
                obscureText: false,
              ),
              const SizedBox(height: 30),
              InputWidget(
                hintText: "Email",
                controller: _emailController,
                obscureText: false,
              ),
              const SizedBox(height: 30),
              InputWidget(
                hintText: "Password",
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  await _authenticationController.register(
                    name: _nameController.text,
                    username: _usernameController.text.trim(),
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                ),
                child: Obx(() {
                  return _authenticationController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : Text('Register',
                          style: GoogleFonts.poppins(fontSize: 18));
                }),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.to(() => const LoginPage());
                },
                child: Text('Login', style: GoogleFonts.poppins(fontSize: 22)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
