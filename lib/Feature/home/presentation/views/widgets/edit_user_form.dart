import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';

import 'package:shawati/Core/utils/styles.dart';

class EditUserForm extends StatefulWidget {
  const EditUserForm({super.key});

  @override
  State<EditUserForm> createState() => _EditUserFormState();
}

class _EditUserFormState extends State<EditUserForm> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String code = '+966';
  String country = 'Saudi Arabia';
  bool obscureTextconpass = true;
  bool obscureTextpass = true;
  var text = RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
            text: 'This site is protected by reCAPTCHA and the Google ',
            style: StylesData.font11.copyWith(
              color: Colors.grey,
            )),
        TextSpan(
            text: 'Privacy Policy',
            style: StylesData.font11.copyWith(
              decoration: TextDecoration.underline,
            )),
        TextSpan(
            text: ' and ',
            style: StylesData.font11.copyWith(
              color: Colors.grey,
            )),
        TextSpan(
            text: 'Terms of Service',
            style: StylesData.font11.copyWith(
              decoration: TextDecoration.underline,
            )),
        TextSpan(
            text: ' apply ',
            style: StylesData.font11.copyWith(
              color: Colors.grey,
            )),
      ],
    ),
  );

  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customTextFormedFiled(
            controller: nameController,
            hintText: 'Full Name',
            preicon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ImageIcon(
                const AssetImage(
                  AssetsData.profile,
                ),
                size: 12,
                color: ConstColor.kMainColor,
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        customTextFormedFiled(
            controller: phoneController,
            hintText: 'Phone',
            sufficon: InkWell(
              onTap: () {
                // showCountryPicker(
                //   context: context,

                //   showPhoneCode:
                //       true, // optional. Shows phone code before the country name.
                //   onSelect: (Country country) {
                //     // country.countryCode;
                //     setState(() {
                //       code = country.phoneCode;
                //       print(country.flagEmoji);

                //       // print(code);
                //     });
                //   },
                // );
              },
              child: SizedBox(
                width: 130,
                child: Row(
                  children: [
                    const Icon(Icons.arrow_drop_down_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage(AssetsData.suadLogo),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Image(
                      image: AssetImage(AssetsData.vectorLogo),
                      height: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      code,
                      style: StylesData.font12,
                    ),
                  ],
                ),
              ),
            ),
            preicon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ImageIcon(
                const AssetImage(
                  AssetsData.calling,
                ),
                size: 12,
                color: ConstColor.kMainColor,
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        customTextFormedFiled(
            controller: passwordController,
            hintText: 'Password',
            obscureText: obscureTextpass,
            sufficon: InkWell(
                onTap: () {
                  setState(() {
                    obscureTextpass = !obscureTextpass;
                  });
                },
                child: obscureTextpass
                    ? const Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                        size: 22,
                      )
                    : const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: ImageIcon(
                          AssetImage(AssetsData.eye),
                          color: Colors.grey,
                          size: 6,
                        ),
                      )),
            preicon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ImageIcon(
                const AssetImage(
                  AssetsData.lock,
                ),
                size: 12,
                color: ConstColor.kMainColor,
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        customTextFormedFiled(
            controller: confirmpasswordController,
            hintText: 'confirm Password',
            obscureText: obscureTextconpass,
            sufficon: InkWell(
                onTap: () {
                  setState(() {
                    obscureTextconpass = !obscureTextconpass;
                  });
                },
                child: obscureTextconpass
                    ? const Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                        size: 22,
                      )
                    : const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: ImageIcon(
                          AssetImage(AssetsData.eye),
                          color: Colors.grey,
                          size: 6,
                        ),
                      )),
            preicon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ImageIcon(
                const AssetImage(
                  AssetsData.lock,
                ),
                size: 12,
                color: ConstColor.kMainColor,
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Center(child: text),
        ),
        const SizedBox(
          height: 20,
        ),
        defaultButton(
            fun: () {
              // NavegatorPush(context, const LangPageView());
            },
            textWidget: Text(
              'Update',
              style: StylesData.font13,
            ),
            height: 54,
            c: ConstColor.kMainColor),
      ],
    );
  }
}
