import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.pushNamed(context, '/home'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child: Image.network(
              "https://media-exp1.licdn.com/dms/image/D4D0BAQH6ozvBUcvvlw/company-logo_100_100/0/1667218449909?e=1676505600&v=beta&t=eIdhwsPElg3NzyG04I7YFR2-vWZQ1XyVdFSb0uUHBL4"),
        ),
      ),
    );
  }
}
