import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';

import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/lang/presentation/views/lang_page_view.dart';
import 'package:shawati/Feature/login/presentation/views/widgets/forgot_password.dart';
import 'package:shawati/Feature/login/presentation/views/widgets/signin_with.dart';
import 'package:shawati/Feature/login/presentation/views/widgets/signup_here.dart';
import 'package:shawati/Feature/splash/presentation/views/widgets/splach_image_logo.dart';
import 'package:shawati/Feature/splash/presentation/views/widgets/tqnia_logo.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String code = '+966';
  String country = 'Saudi Arabia';
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: 60.0, left: 16.0, right: 16.0, bottom: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Center(
                      child: SizedBox(width: 120, child: SplachViewImage())),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Login To Your',
                    style: StylesData.font24Google,
                  ),
                  Text(
                    'Account!',
                    style: StylesData.font24Google,
                  ),
                  Text(
                    'Please, provide your information',
                    style: StylesData.font12,
                  ),
                  const SizedBox(
                    height: 30,
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
                                backgroundImage:
                                    AssetImage(AssetsData.suadLogo),
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
                  customTextFormedFiled(
                      controller: passwordController,
                      obscureText: obscureText,
                      hintText: 'Password',
                      sufficon: InkWell(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: obscureText
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
                        padding: const EdgeInsets.all(10.0),
                        child: ImageIcon(
                          const AssetImage(
                            AssetsData.lock,
                          ),
                          size: 2,
                          color: ConstColor.kMainColor,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      fun: () {
                        NavegatorPush(
                            context,
                            const LangPageView(
                              fromLogin: true,
                            ));
                      },
                      textWidget: Text(
                        'Log in',
                        style: StylesData.font13,
                      ),
                      height: 54,
                      c: ConstColor.kMainColor),
                  const SizedBox(
                    height: 20,
                  ),
                  const ForGotPassword(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Or Sign In with ',
                    style: StylesData.font12.copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SigninWithWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SignUpHere(),
                ],
              ),
            ),
            const SliverFillRemaining(
              hasScrollBody: false,
              child:
                  Align(alignment: Alignment.bottomCenter, child: TqniaLogo()),
            )
          ],
        ));
  }
}
