import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:splash_and_dash_apk/components/default_button.dart';
import 'package:splash_and_dash_apk/models/auth/auth_service.dart';
import 'package:splash_and_dash_apk/screens/home/home_screen.dart';
import 'package:splash_and_dash_apk/screens/login_success/login_success_screen.dart';
import 'package:splash_and_dash_apk/size_config.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  String smsCode;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          PinCodeTextField(
            appContext: context,
            length: 6,
            onChanged: (value) {
              smsCode = value;
            },
            animationType: AnimationType.scale,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            pinTheme: PinTheme.defaults(
              shape: PinCodeFieldShape.box,
              activeColor: Colors.black,
              inactiveColor: Colors.black,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () async {
              bool signedIn = await context
                  .read<AuthService>()
                  .checkOtpAndSignUpWithPhone(smsCode);

              if (signedIn) {
                context.read<AuthService>().linkEmailWithPhone();
              } else {
                print("WRONG OTP");
              }
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          )
        ],
      ),
    );
  }
}
