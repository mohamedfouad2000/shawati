import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/local/cache_Helper.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/forget%20password/presentation/views/forget_password_view.dart';
import 'package:shawati/Feature/home/presentation/views/home_view.dart';
import 'package:shawati/Feature/location/presentation/views/enable_location_view.dart';
import 'package:shawati/Feature/login/data/repo/login_repo_imp.dart';
import 'package:shawati/Feature/login/presentation/manager/Login/login_cubit.dart';
import 'package:shawati/Feature/login/presentation/manager/Login/login_state.dart';
import 'package:shawati/Feature/login/presentation/views/widgets/signup_here.dart';
import 'package:shawati/Feature/splash/presentation/views/widgets/splach_image_logo.dart';
import 'package:shawati/Feature/splash/presentation/views/widgets/tqnia_logo.dart';
import 'package:shawati/generated/l10n.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody(
      {super.key,
      required this.phoneController,
      required this.passwordController});
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String code = '+20';
  String eroorMsq = '';
  // String country = 'Saudi Arabia';
  bool obscureText = true;
  var formKey = GlobalKey<FormState>();
  bool isChecked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.phoneController.text = code;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: 60.0, left: 16.0, right: 16.0, bottom: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BlocProvider(
                create: (context) => LoginCubit(LoginRepoImpl()),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      if (state.model.data?.token != null) {
                        TOKEN = state.model.data?.token ?? '';
                        if (state.model.data?.token != null) {
                          if (isChecked) {
                            CacheHelper.saveData(key: 'Token', value: TOKEN)
                                .then((value) =>
                                    {Nav(context, const EnableLocation())});
                          } else {
                            Nav(context, const EnableLocation());
                          }
                          // TOKEN = state.model.data?.token ?? '';

                          // CacheHelper.saveData(key: 'Token', value: TOKEN).then(
                          //     (value) =>
                          //         {Nav(context, const EnableLocation())});
                        }
                      }
                    } else if (state is LoginFailed) {
                      state.msg.toString() == 'Login Successfully'
                          ? showToast(
                              msq: 'This Account Is Provider Canot Login Here')
                          : showToast(msq: state.msg.toString());
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const Center(
                              child: SizedBox(
                                  width: 120, child: SplachViewImage())),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            S.of(context).LoginToYour,
                            style: StylesData.font24Google,
                          ),
                          Text(
                            S.of(context).Account,
                            style: StylesData.font24Google,
                          ),
                          Text(
                            S.of(context).Pleaseprovideyourinformation,
                            style: StylesData.font12,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // customTextFormedFiled(
                          //     controller: widget.phoneController,
                          //     type: TextInputType.number,
                          //     hintText: S.of(context).phone,
                          //     sufficon: InkWell(
                          //       onTap: () {
                          //         showCountryPicker(
                          //           context: context,

                          //           showPhoneCode:
                          //               true, // optional. Shows phone code before the country name.
                          //           onSelect: (Country country) {
                          //             // country.countryCode;
                          //             setState(() {
                          //               code = '+${country.phoneCode}';
                          //               widget.phoneController.text = code;

                          //               // print(code);
                          //             });
                          //           },
                          //         );
                          //       },
                          //       child: SizedBox(
                          //         width: 80,
                          //         child: Row(
                          //           children: [
                          //             const Icon(
                          //                 Icons.arrow_drop_down_outlined),
                          //             // const SizedBox(
                          //             //   width: 10,
                          //             // ),
                          //             // const CircleAvatar(
                          //             //   radius: 12,
                          //             //   backgroundImage:
                          //             //       AssetImage(AssetsData.suadLogo),
                          //             // ),
                          //             // const SizedBox(
                          //             //   width: 10,
                          //             // ),
                          //             const Image(
                          //               image:
                          //                   AssetImage(AssetsData.vectorLogo),
                          //               height: 20,
                          //             ),
                          //             const SizedBox(
                          //               width: 10,
                          //             ),
                          //             Text(
                          //               code,
                          //               style: StylesData.font12,
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     preicon: Padding(
                          //       padding: const EdgeInsets.all(10.0),
                          //       child: ImageIcon(
                          //         const AssetImage(
                          //           AssetsData.calling,
                          //         ),
                          //         size: 12,
                          //         color: ConstColor.kMainColor,
                          //       ),
                          //     )),

                          IntlPhoneField(
                            // disableLengthCheck: true,

                            initialCountryCode: 'SA',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,

                            onChanged: (phone) {
                              if (phone.number[0] == '0') {
                                print("sha is ${phone.number[0]}");

                                setState(() {
                                  widget.phoneController.text = '';
                                });
                              }
                              code = phone.countryCode;
                              print("$code${widget.phoneController.text}");

                              print(phone.completeNumber); //get complete number
                              print(phone.countryCode); // get country code only
                              print(phone.number);
                            },
                            // onSaved: (phone) {
                            //   // Save the phone number
                            // },
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            controller: widget.phoneController,
                            style: StylesData.font14
                                .copyWith(color: ConstColor.kMainColor),

                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              hintText: S.of(context).phone,
                              hintStyle: StylesData.font14
                                  .copyWith(color: const Color(0x330D223F)),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ImageIcon(
                                  const AssetImage(
                                    AssetsData.calling,
                                  ),
                                  size: 12,
                                  color: ConstColor.kMainColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: ConstColor.kMainColor),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFFEAEAEA)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFFEAEAEA)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),

                            enabled: true,

                            // focusNode: focusNode,
                            validator: (value) {
                              String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                              RegExp regExp = RegExp(pattern);
                              if (value == null || value.number.isEmpty) {
                                return 'Sila masukkan nombor telefon.';
                              } else if (!regExp.hasMatch(value.number)) {
                                return 'Sila masukkan nombor telefon yang sah.';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          customTextFormedFiled(
                              controller: widget.passwordController,
                              obscureText: obscureText,
                              hintText: S.of(context).password,
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
                          if (eroorMsq != '')
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                              child: Center(
                                  child: Text(
                                eroorMsq,
                                style: StylesData.font14
                                    .copyWith(color: Colors.white),
                              )),
                            ),
                          if (eroorMsq != '')
                            const SizedBox(
                              height: 20,
                            ),

                          defaultButton(
                              fun: () {
                                formKey.currentState!.validate();
                                if (formKey.currentState!.validate()) {
                                  if (widget.phoneController.text != '' &&
                                      widget.phoneController.text != '') {
                                    BlocProvider.of<LoginCubit>(context).loginUser(
                                        phone:
                                            '${code.substring(1)}${widget.phoneController.text}',
                                        password:
                                            widget.passwordController.text);
                                  } else {
                                    setState(() {
                                      eroorMsq = S.of(context).PhoneError;
                                    });
                                  }
                                }

                                // NavegatorPush(
                                //     context,
                                //     const LangPageView(
                                //       fromLogin: true,
                                //     ));
                              },
                              textWidget: state is LoginLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ))
                                  : Text(
                                      S.of(context).Login,
                                      style: StylesData.font13,
                                    ),
                              height: 54,
                              c: ConstColor.kMainColor),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  focusColor: ConstColor.kMainColor,
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.of(context).Rememberme,
                                style: StylesData.font12,
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  NavegatorPush(
                                      context, const ForgetPasswordView());
                                },
                                child: Text(
                                  S.of(context).ForgotYourPassword,
                                  style: StylesData.font10,
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // Text(
                          //   'Or Sign In with ',
                          //   style: StylesData.font12.copyWith(fontSize: 14),
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // const SigninWithWidget(),
                          const SizedBox(
                            height: 40,
                          ),
                          const SignUpHere(),
                        ],
                      ),
                    );
                  },
                ),
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
