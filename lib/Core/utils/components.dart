// import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/screens/notification_screen.dart';

Widget defaultButton({
  required VoidCallback fun,
  required textWidget,
  required Color c,
  double radius = 20,
  double height = 63,
  double width = double.infinity,
}) =>
    InkWell(
      onTap: () {
        fun();
      },
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: c,
          borderRadius: BorderRadius.circular(
            radius,
          ),
          border: Border.all(
            color: ConstColor.kMainColor, //                   <--- border color
          ),
        ),
        child: Center(
          child: textWidget,
        ),
      ),
    );

Widget customTextFiled(
        {required TextEditingController controller,
        TextInputType type = TextInputType.name,
        Widget? prefixIcon,
        var ontapFun,
        String? hintText,
        bool enabled = true,
        Function(String)? onChanged,
        double rad = 10,
        int maxLines = 1}) =>
    TextField(
      enabled: enabled,
      controller: controller,
      onTap: ontapFun,
      onSubmitted: (v) {
        ontapFun;
      },
      maxLines: maxLines,
      onChanged: onChanged,
      keyboardType: type,
      style: StylesData.font14.copyWith(color: ConstColor.kMainColor),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: StylesData.font14.copyWith(color: const Color(0x330D223F)),

        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ConstColor.kMainColor),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        // labelText: 'Password',
      ),
    );
Widget customTextFormedFiled({
  required controller,
  TextInputType type = TextInputType.name,
  Widget? preicon,
  bool obscureText = false,
  bool enabled = true,
  String val = "",
  Widget? sufficon,
  String? hintText,
  Function(String)? onChanged,
  Function()? onTap,
  Function()? sufFunction,
  double rad = 10,
  maxLines = 1,
  // required void Function()? onPressed,
}) =>
    TextFormField(
      onChanged: onChanged,
      enabled: enabled,
      onTap: onTap,
      controller: controller,
      obscureText: obscureText,
      keyboardType: type,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return '';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      style: StylesData.font14.copyWith(color: ConstColor.kMainColor),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintText: hintText,
        prefixIcon: preicon,
        suffixIcon: sufficon ?? const SizedBox(),
        // isDense: true,
        // suffixIconConstraints: const BoxConstraints(
        //   minWidth: 2,
        //   minHeight: 2,
        // ),

        hintStyle: StylesData.font14.copyWith(color: const Color(0x330D223F)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: ConstColor.kMainColor),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),

        // labelText: 'Password',
      ),
    );

NavegatorPush(context, page) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (builder) => page),
  );
}

Nav(context, page) {
  return Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (builder) => page), (route) => false);
}

Color colorHex(String color) {
  print(color);
  if (color == '' || color == 'null') {
    return ConstColor.kMainColor;
  }
  return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
}

// Widget countryPicker(context) => InkWell(
//       onTap: () {
//         showCountryPicker(
//           context: context,
//           showPhoneCode:
//               true, // optional. Shows phone code before the country name.
//           onSelect: (Country country) {
//             country.countryCode;
//             print('Select country: ${country.displayName}');
//           },
//         );
//       },
//       child: SizedBox(
//         width: 130,
//         child: Row(
//           children: [
//             const Icon(Icons.arrow_drop_down_outlined),
//             const SizedBox(
//               width: 10,
//             ),
//             const CircleAvatar(
//               radius: 12,
//               backgroundImage: AssetImage(AssetsData.suadLogo),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             const Image(
//               image: AssetImage(AssetsData.vectorLogo),
//               height: 20,
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Text(
//               "+966",
//               style: StylesData.font12,
//             ),
//           ],
//         ),
//       ),
//     );

AppBar customAppBar(context,
    {Widget widget = const SizedBox(), Widget title = const SizedBox()}) {
  return AppBar(
    actions: [widget],
    centerTitle: true,
    title: title,
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
              color: ConstColor.kMainColor,
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    ),
  );
}

AppBar customAppBarWithNotification(context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
              color: ConstColor.kMainColor,
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    ),
    actions: [
      InkWell(
        onTap: () {
          NavegatorPush(context, const NotificationScreen());
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: .7),
                borderRadius: const BorderRadius.all(
                  Radius.circular(13),
                )),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage(AssetsData.notification),
                height: 15,
                width: 15,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

AppBar customAppBarInNotification(context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
              color: ConstColor.kMainColor,
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    ),
    actions: [
      InkWell(
        onTap: () {},
        child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                const Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.black,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 9,
                      child: Center(
                          child: Icon(
                        Icons.check,
                        size: 10,
                      )),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  "Mask all read",
                  style: StylesData.font12,
                )
              ],
            )),
      ),
    ],
  );
}

AppBar customAppBarWithCallender(context) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
              color: ConstColor.kMainColor,
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    ),
    actions: [
      InkWell(
        onTap: () {
          // NavegatorPush(context, const NotificationScreen());
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            height: 45,
            width: 125,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.grey.withOpacity(.5), width: .7),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  const AssetImage(AssetsData.note),
                  size: 20,
                  color: ConstColor.kMainColor,
                ),
                Text(
                  " For Rent ",
                  style: StylesData.font10.copyWith(
                      color: const Color(0xff222B45),
                      fontWeight: FontWeight.w400),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
