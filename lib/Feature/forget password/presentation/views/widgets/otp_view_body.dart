import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shawati/Feature/splash/presentation/views/widgets/tqnia_logo.dart';

class OTPViewBody extends StatelessWidget {
  const OTPViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Write your OTP code',
            style: StylesData.font24Google,
          ),
          Text(
            'Enter The 4-Digit Code Sent To You At',
            style: StylesData.font12,
          ),
          Text(
            '+966 6677 628910 ',
            style: StylesData.font12,
          ),
          const SizedBox(
            height: 60,
          ),
          OtpTextField(
            numberOfFields: 4,
            fieldHeight: 80,
            fieldWidth: 60,
            borderColor: ConstColor.kMainColor,
            borderRadius: BorderRadius.circular(20),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {}, // end onSubmit
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffEEF3FF),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            height: 40,
            width: 180,
            child: Center(
              child: Text(
                "I Haven’t receved a code ",
                style: StylesData.font11,
              ),
            ),

            //
          ),
          const SizedBox(
            height: 30,
          ),
          defaultButton(
              fun: () {
                // NavegatorPush(context, const OPTView());
              },
              textWidget: Text(
                'Send OTP',
                style: StylesData.font13,
              ),
              height: 54,
              c: ConstColor.kMainColor),
          const Spacer(),
          const Center(child: TqniaLogo())
        ],
      ),
    );
  }
}
