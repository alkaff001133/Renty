import 'package:ahgaff_student/class/regester.dart';
import 'package:ahgaff_student/component/authentication/forget_password.dart';
import 'package:ahgaff_student/component/authentication/home.dart';
import 'package:ahgaff_student/component/authentication/register_page.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text(
          "Login Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 200),
            Form(
              key: _formKey,
              child: Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          label: Text("Email"),
                          hintText: "enter your Email",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Iconsax.send_1_bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          label: Text("Password"),
                          hintText: "enter your Password",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Iconsax.lock_1_bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              activeColor: Color.fromRGBO(49, 39, 79, 1),
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                            Text("Remember me"),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPassword(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color.fromRGBO(196, 135, 198, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              _rememberMe) {
                            //
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                            setState(() {
                              _formKey.currentState!.reset();
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please fill in all fields'),
                              ),
                            );
                          }
                        },
                        color: Color.fromRGBO(49, 39, 79, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 50,
                        minWidth: 100,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.black12),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Login with",
                            style: TextStyle(color: Colors.black26),
                          ),
                        ),
                        Expanded(
                          child: Divider(thickness: 1, color: Colors.black12),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Bootstrap.google),
                        Icon(Bootstrap.facebook),
                        Icon(Bootstrap.github),
                        Icon(Bootstrap.apple),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(
                                  color: Color.fromRGBO(49, 39, 79, .6),
                                ),
                              ),
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  color: Color.fromRGBO(49, 39, 79, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // Form(
        //   key: _formKey,
        //   child: Column(
        //     children: [
        //       TextFormField(
        //         controller: _emailController,
        //         decoration: const InputDecoration(
        //           hintText: "Email",
        //         ),
        //       ),
        //       TextFormField(
        //         controller: _passwordController,
        //         decoration: const InputDecoration(
        //           hintText: "Password",
        //         ),
        //       ),
        //       ElevatedButton(
        //         onPressed: () {
        //           if (_formKey.currentState!.validate()) {
        //             // Process data.
        //           }
        //         },
        //         child: const Text('Submit'),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
