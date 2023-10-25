import 'package:blubroject/controllers/authetication.dart';
import 'package:blubroject/view/widgets/input_widget.dart';
import 'package:blubroject/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final AutheticationController _autheticationController =
      Get.put(AutheticationController());

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
              Text('Register Page',
                  style: GoogleFonts.poppins(fontSize: size * 0.080)),
              SizedBox(
                height: 30,
              ),
              InputWidget(
                hintText: 'Name ',
                obscureText: false,
                controller: _nameController,
              ),
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
                hintText: 'Email',
                obscureText: false,
                controller: _emailcontroller,
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
                    backgroundColor: Colors.black,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    )),
                onPressed: () async {
                  await _autheticationController.register(
                    name: _nameController.text.trim(),
                    username: _usernameController.text.trim(),
                    email: _emailcontroller.text.trim(),
                    password: _passwordController.text.trim(),
                  );
                },
                child: Obx(
                  () {
                    return _autheticationController.isloading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Register',
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
                    () => LoginPage(),
                  );
                },
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontSize: size * 0.040,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
