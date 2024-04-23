import 'package:flutter/material.dart';

import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';

import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/lang/presentation/views/lang_page_view.dart';
import 'package:shawati/Feature/register/presentation/views/widgets/accept_all_terms.dart';
import 'package:shawati/Feature/register/presentation/views/widgets/login_here.dart';
import 'package:shawati/Feature/splash/presentation/views/widgets/splach_image_logo.dart';
import 'package:shawati/Feature/splash/presentation/views/widgets/tqnia_logo.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String code = '+966';
  String country = 'Saudi Arabia';
  bool obscureTextconpass = true;
  bool obscureTextpass = true;

  TextEditingController confirmpasswordController = TextEditingController();

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
                    'Create new',
                    style: StylesData.font24Google,
                  ),
                  Text(
                    'Account!',
                    style: StylesData.font24Google,
                  ),
                  Text(
                    'Are you ready to make a new account, Let’s go',
                    style: StylesData.font12,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
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
                  const AcceptAllTerms(),
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
                        'Sign Up',
                        style: StylesData.font13,
                      ),
                      height: 54,
                      c: ConstColor.kMainColor),
                  const SizedBox(
                    height: 20,
                  ),
                  const LoginInHere(),
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
