import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/local/cache_Helper.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/model/terms_and_privacy_model/data.dart';
import 'package:shawati/Feature/home/presentation/views/home_view.dart';
import 'package:shawati/Feature/home/presentation/views/screens/Privacy_policy_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/fav_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/notification_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/refund_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/support_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/terms_screen.dart';
import 'package:shawati/Feature/lang/presentation/views/lang_page_view.dart';
import 'package:shawati/Feature/login/data/repo/login_repo_imp.dart';
import 'package:shawati/Feature/login/presentation/views/login_view.dart';
import 'package:shawati/generated/l10n.dart';

class ListTitleMenu extends StatefulWidget {
  const ListTitleMenu({
    super.key,
    required this.data,
  });
  final TermAndPrivacyData data;

  @override
  State<ListTitleMenu> createState() => _ListTitleMenuState();
}

class _ListTitleMenuState extends State<ListTitleMenu> {
  List<String> titlesArabic = [
    'الحجزات الخاصه بك ',
    'اللـغه',
    'الاشعـارات',
    'قائمه المفضله',
    'الدعـم',
    'الشروط والأحكام',
    '',
    '',
    'تسجيل الخروج',
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      const HomeView(
        currentidex: 2,
      ),
      const LangPageView(
        fromLogin: false,
      ),
      const NotificationScreen(),
      const FavoritesScreen(),
      const SupportScreen(),
      if (widget.data.termsStatus != 0)
        TermsScreen(
          termsText: widget.data.term ?? '',
          termsTextAr: widget.data.termAr ?? '',
        ),
      if (widget.data.refundStatus != 0)
        RefundScreen(
          refundText: widget.data.refundPolicy ?? '',
          refundTextAr: widget.data.refundPolicyAr ?? '',
        ),
      if (widget.data.privacyStatus != 0)
        PrivacyPolicyScreen(
          privacyText: widget.data.privacyPolicy ?? '',
          privacyTextAr: widget.data.privacyPolicyAr ?? '',
        ),
      const LoginView(),
    ];
    List<String> images = [
      AssetsData.mybooking,
      AssetsData.language,
      AssetsData.notification,
      AssetsData.favorites,
      AssetsData.support,
      if (widget.data.termsStatus != 0) AssetsData.terms,
      if (widget.data.refundStatus != 0) AssetsData.terms,
      if (widget.data.privacyStatus != 0) AssetsData.terms,
      AssetsData.logout,
    ];
    List<String> titles = [
      S.of(context).MyBooking,
      S.of(context).Language,
      S.of(context).Notifications,
      S.of(context).favorites,
      S.of(context).support,
      if (widget.data.termsStatus != 0) S.of(context).termsconditions,
      if (widget.data.refundStatus != 0) S.of(context).Refunds,
      if (widget.data.privacyStatus != 0) S.of(context).Privacypolicy,
      S.of(context).logout,
    ];
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return menuItem(
            title: titles[index],
            image: images[index],
            titles: titles,
            context: context,
            widget: widgets[index],
            index: index,
            titleArabic: titlesArabic[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: widgets.length,
    );
  }

  Widget menuItem(
          {required String title,
          required String titleArabic,
          required String image,
          required context,
          required List<String> titles,
          required Widget widget,
          required int index}) =>
      InkWell(
        onTap: () {
          if (index == 0 || index == (titles.length) - 1) {
            if (index == (titles.length) - 1) {
              CacheHelper.removeData(key: 'Token');
              TOKEN = '';
            }

            Nav(context, widget);
          } else {
            NavegatorPush(context, widget);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            // color: Colors.black,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 1),
                  blurRadius: 2,
                  spreadRadius: 1,
                  color: Theme.of(context).primaryColor.withOpacity(.125))
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  //
                  color: index == (titles.length) - 1
                      ? const Color(0xffF2E1E1)
                      : const Color(0xffEEF3FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: Image(
                  image: AssetImage(image),
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  titles[index],
                  style: StylesData.font12.copyWith(
                    color: index == (titles.length) - 1
                        ? const Color(0xffFC2323)
                        : Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                  onPressed: () async {
                    print(index);
                    print((titles.length) - 1);

                    if (index == 0 || index == ((titles.length) - 1)) {
                      if (index == (titles.length) - 1) {
                        LoginRepoImpl repo = LoginRepoImpl();
                        String? fcmToken = '';
                        fcmToken = await FirebaseMessaging.instance.getToken();
                        print("Token is $fcmToken");
                        await repo.logOut(fcmToken: fcmToken ?? '');

                        CacheHelper.removeData(key: 'Token');
                        TOKEN = '';
                      }

                      Nav(context, widget);
                    } else {
                      NavegatorPush(context, widget);
                    }
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 16,
                    color: Colors.grey.shade300,
                  ))
            ],
          ),
        ),
      );
}
