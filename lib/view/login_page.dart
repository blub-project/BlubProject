import 'package:blubroject/controllers/authentication.dart';
import 'package:blubroject/view/widgets/input_widget.dart';
import 'package:blubroject/view/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthenticationController _autheticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login Page',
                  style: GoogleFonts.poppins(fontSize: size * 0.080)),
              SizedBox(
                height: 30,
              ),
              InputWidget(
                hintText: 'Username',
                obscureText: false,
                controller: _usernameController,
              ),
              SizedBox(
                height: 30,
              ),
              InputWidget(
                hintText: 'Password',
                obscureText: true,
                controller: _passwordController,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 75, 140, 253),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    )),
                onPressed: () async {
                  await _autheticationController.login(
                      username: _usernameController.text.trim(),
                      password: _passwordController.text.trim());
                },
                child: Obx(
                  () {
                    return _autheticationController.isloading.value
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Login',
                            style: GoogleFonts.poppins(fontSize: size * 0.040),
                          );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Get.to(
                    () => RegisterPage(),
                  );
                },
                child: Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    fontSize: size * 0.040,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
