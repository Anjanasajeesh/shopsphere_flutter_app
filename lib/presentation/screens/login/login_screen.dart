import 'package:flutter/material.dart';
import 'package:shopsphere/presentation/widgets/bottom_navbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true;

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEBEDFA), Color(0xFFDADFF5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),

              child: Column(
                children: [
                  const SizedBox(height: 60),

                  SizedBox(
                    width: 54.64,
                    height: 56,
                    child: Image.asset("assets/images/login_logo.png"),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: 207,
                    height: 88,
                    child: Image.asset("assets/images/login_title.png"),
                  ),

                  const SizedBox(height: 40),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333740),
                        ),
                      ),

                      const SizedBox(height: 6),

                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFF333740)),
                        ),

                        child: TextField(
                          controller: phoneController,

                          decoration: const InputDecoration(
                            border: InputBorder.none,

                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 12, right: 8),
                              child: Text(
                                "🇮🇳 +91",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),

                            prefixIconConstraints: BoxConstraints(minWidth: 0),

                            hintText: "",

                            contentPadding: EdgeInsets.only(bottom: 8),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333740),
                        ),
                      ),

                      const SizedBox(height: 6),

                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFF333740)),
                        ),

                        child: TextField(
                          controller: passwordController,

                          obscureText: obscure,

                          decoration: InputDecoration(
                            border: InputBorder.none,

                            hintText: "********",

                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),

                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscure = !obscure;
                                });
                              },

                              child: const Icon(
                                Icons.visibility,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF333740),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  socialButton(
                    image: "assets/images/google_logo.png",
                    text: "Continue with Google",
                  ),

                  const SizedBox(height: 12),

                  socialButton(
                    image: "assets/images/facebook_logo.png",
                    text: "Continue with Facebook",
                  ),

                  const SizedBox(height: 30),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavbar(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF333740), Color(0xFF4A4E57)],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "By signing up, you agree to our Terms. See how we use your data in our Privacy Policy.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10, color: Color(0xFF333740)),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget socialButton({required String image, required String text}) {
    return Container(
      width: double.infinity,
      height: 35,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 18, height: 18),

          const SizedBox(width: 10),

          Text(
            text,
            style: const TextStyle(fontSize: 14, color: Color(0xFF333740)),
          ),
        ],
      ),
    );
  }
}
