import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/button.dart';
import 'package:weatherapp/widgets/text_field.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather data"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              label: "Email",
              obscure: true,
              placeholder: 'mesfin@gmail.com',
            ),
            const SizedBox(height: 30),
            CustomTextField(
              label: "Password",
              obscure: true,
              placeholder: '....',
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "Sign in",
              onPressed: () => Navigator.pushNamed(context, '/weather'),
            ),
          ],
        ),
      ),
    );
  }
}
