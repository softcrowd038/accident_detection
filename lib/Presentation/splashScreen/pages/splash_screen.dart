// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:accident/Presentation/Navigation/page_navigation.dart';
import 'package:accident/Presentation/login_and_registration/pages/login_registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        _navigateAfterSplash();
      }
    });
  }

  Future<void> _navigateAfterSplash() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final authToken = sharedPreferences.getString('auth_token');
    if (authToken != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget _verticalDivider() {
    return Container(
      width: 1,
      height: 20,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff020053),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 60),
              Container(
                color: Colors.white,
                child: Image.asset(
                  "assets/images/logo3.gif",
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.height * 0.25,
                ),
              ),
              const Spacer(),
              const Text(
                'Created By',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Uday Sonawane',
                    style: TextStyle(color: Colors.white),
                  ),
                  _verticalDivider(),
                  const Text(
                    'Nilesh Dhongade',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Aditya Sonawane',
                    style: TextStyle(color: Colors.white),
                  ),
                  _verticalDivider(),
                  const Text(
                    'Prathamesh Kor',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
