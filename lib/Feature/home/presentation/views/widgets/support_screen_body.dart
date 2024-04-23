import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';

class SupportScreenBody extends StatefulWidget {
  const SupportScreenBody({super.key});

  @override
  State<SupportScreenBody> createState() => _SupportScreenBodyState();
}

class _SupportScreenBodyState extends State<SupportScreenBody> {
  TextEditingController callusController = TextEditingController();
  TextEditingController emailusController = TextEditingController();
  TextEditingController note1controller = TextEditingController();
  TextEditingController note2controller = TextEditingController();

  int maxline1 = 1;
  int maxline2 = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              "Support",
              style: StylesData.font24Google,
            )),
            const SizedBox(
              height: 4,
            ),
            Center(
                child: Text(
              "let us know our queries & feedback",
              style: StylesData.font12,
            )),
            const SizedBox(
              height: 15,
            ),
            customTextFormedFiled(
                controller: callusController,
                hintText: 'call us',
                sufficon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage(AssetsData.calling),
                    height: 12,
                    width: 12,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            customTextFormedFiled(
                controller: emailusController,
                hintText: 'email us',
                sufficon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage(
                      AssetsData.sms,
                    ),
                    height: 12,
                    width: 12,
                  ),
                )),
            const SizedBox(
              height: 35,
            ),
            Text(
              "write us",
              style: StylesData.font18,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "enter your message",
              style: StylesData.font12,
            ),
            const SizedBox(
              height: 15,
            ),
            customTextFormedFiled(
              controller: note1controller,
              maxLines: maxline1,
              sufficon: InkWell(
                onTap: () {
                  setState(() {
                    maxline1 = maxline1 == 6 ? 1 : maxline1 = 6;
                  });
                },
                child: maxline1 == 1
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff27A6FF)))
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.keyboard_arrow_up_outlined,
                            color: Color(0xff27A6FF))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            customTextFormedFiled(
              controller: note2controller,
              maxLines: maxline2,
              sufficon: InkWell(
                onTap: () {
                  setState(() {
                    maxline2 = maxline2 == 6 ? 1 : maxline2 = 6;
                  });
                },
                child: maxline2 == 1
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff27A6FF)))
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.keyboard_arrow_up_outlined,
                            color: Color(0xff27A6FF))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            defaultButton(
                fun: () {
                  // NavegatorPush(context, const LangPageView());
                },
                textWidget: Text(
                  'submit',
                  style: StylesData.font13,
                ),
                height: 54,
                c: ConstColor.kMainColor),
          ],
        ),
      ),
    );
  }
}
