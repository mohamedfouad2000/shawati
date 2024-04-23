import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/forget%20password/presentation/views/opt_view.dart';
import 'package:shawati/Feature/splash/presentation/views/widgets/tqnia_logo.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  TextEditingController phoneController = TextEditingController();
  String code = '+966';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Forgot Password',
            style: StylesData.font24Google,
          ),
          Text(
            'Don’t worry, take it easy!',
            style: StylesData.font12,
          ),
          const SizedBox(
            height: 20,
          ),
          const Image(
            image: AssetImage(
              AssetsData.forgetPassword,
            ),
            height: 120,
            width: 120,
          ),
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
                padding: const EdgeInsets.all(10.0),
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
          defaultButton(
              fun: () {
                NavegatorPush(context, const OPTView());
              },
              textWidget: Text(
                'Reset password',
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
