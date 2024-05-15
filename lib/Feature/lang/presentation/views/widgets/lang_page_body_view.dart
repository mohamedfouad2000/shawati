import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/local/cache_Helper.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/location/presentation/views/enable_location_view.dart';
import 'package:shawati/Feature/splash/presentation/views/widgets/tqnia_logo.dart';
import 'package:shawati/generated/l10n.dart';

class LangPageViewBody extends StatefulWidget {
  const LangPageViewBody({super.key, required this.fromLogin});
  final bool fromLogin;

  @override
  State<LangPageViewBody> createState() => _LangPageViewBodyState();
}

class _LangPageViewBodyState extends State<LangPageViewBody> {
  late bool arabicLang;
  @override
  void initState() {
    arabicLang = LocalizationCubit.get(context).isArabic();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).Languages,
            style: StylesData.font24Google,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              setState(() {
                BlocProvider.of<LocalizationCubit>(context).changelocale('en');

                arabicLang = false;
                CacheHelper.saveData(key: 'isarbic', value: false);
              });
            },
            child: Container(
              height: 76,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(
                    color: arabicLang
                        ? Colors.grey.shade300
                        : ConstColor.kMainColor),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 44,
                    width: 44,
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: ConstColor.kMainColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Image(
                      image: AssetImage(
                        AssetsData.english,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "English",
                    style: StylesData.font12.copyWith(color: Colors.black),
                  ),
                  const Spacer(),
                  if (!arabicLang)
                    Container(
                      height: 27,
                      width: 27,
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: ConstColor.kMainColor,
                        border: Border.all(color: ConstColor.kMainColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              setState(() {
                arabicLang = true;
                BlocProvider.of<LocalizationCubit>(context).changelocale('ar');
                CacheHelper.saveData(key: 'isarbic', value: true);
              });
            },
            child: Container(
              height: 76,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(
                    color: !arabicLang
                        ? Colors.grey.shade300
                        : ConstColor.kMainColor),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 44,
                    width: 44,
                    padding: const EdgeInsets.all(3.0),
                    decoration: const BoxDecoration(
                      // border: Border.all(color: ConstColor.kMainColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Image(
                      image: AssetImage(
                        AssetsData.arabic,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "عربي",
                    style: StylesData.font12.copyWith(color: Colors.black),
                  ),
                  const Spacer(),
                  if (arabicLang)
                    Container(
                      height: 27,
                      width: 27,
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: ConstColor.kMainColor,
                        border: Border.all(color: ConstColor.kMainColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const Spacer(),
          if (widget.fromLogin)
            defaultButton(
                fun: () {
                  NavegatorPush(context, const EnableLocation());
                },
                textWidget: Text(
                  'Select',
                  style: StylesData.font13,
                ),
                height: 54,
                c: ConstColor.kMainColor),
          if (widget.fromLogin)
            const SizedBox(
              height: 15,
            ),
          if (widget.fromLogin) const Center(child: TqniaLogo())
        ],
      ),
    );
  }
}
