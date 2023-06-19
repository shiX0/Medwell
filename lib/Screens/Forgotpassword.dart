import 'package:flutter/material.dart';
import 'package:medwell/Components/InputField.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Image.asset(
                'assets/images/Password_Monochromatic 1.png',
                height: 200,
              ),
            ),
            Text(
              'Reset Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text('Use a strong password.'),
            SizedBox(height: 16),
            CustomTextInputField(hintText: "New password", keyboardType: TextInputType.text),
            SizedBox(height: 16),
            CustomTextInputField(hintText: "Confirm password", keyboardType: TextInputType.text),

            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement password reset logic
              },
              child: Text('Take me to Home'),
            ),

          ],
        ),
      ),
    );
  }
}
