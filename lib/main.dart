import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:shawati/Core/blocobserve.dart';
import 'package:shawati/Core/local/cache_Helper.dart';
import 'package:shawati/Core/remote/dio_helper.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/size_config.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Add%20Or%20Remove%20Fav/add_or_remove_fav_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_state.dart';
import 'package:shawati/Feature/splash/presentation/views/splach_view.dart';
import 'package:shawati/generated/l10n.dart';
import 'package:shawati/notification/local_notifications/notifications_serves.dart';
import 'package:shawati/notification/push_notification.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  // await LocalNotificationService.init();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyCrO9xWB-shiRnGXxGtCKHLk9MvosgBC00',
              appId: '1:842250419854:android:760d08d96db93ef53a53df',
              messagingSenderId: '842250419854',
              projectId: 'shawate-users'),
        )
      : await Firebase.initializeApp();

  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  FirebaseMessaging.instance.requestPermission();
  FirebaseMessaging.instance
      .requestPermission()
      .then((NotificationSettings settings) {
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined permission');
    }
  });

// Listen for incoming FCM messages
  firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  firebaseMessaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((event) {
    NotificationSound.onMessage(event);
    print('onMessage');
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    NotificationSound.onMessageOpenedApp(event);
    print('onMessageOpenedApp');
  });
  FirebaseMessaging.onBackgroundMessage(
      NotificationSound.firebaseMessagingBackgroundHandler);
  String? token = await FirebaseMessaging.instance.getToken();
  print("Token is // $token");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool isarbic = CacheHelper.getData(key: 'isarbic') ?? false;

    @override
    initState() {
      // TODO: implement initState
      super.initState();
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(HomeRepoImpl()),
        ),
        BlocProvider(
          create: (context) => AddOrRemoveFavCubit(HomeRepoImpl()),
        ),
        BlocProvider(
          create: (context) {
            return LocalizationCubit(HomeRepoImpl())
              ..l = isarbic ? const Locale('ar') : const Locale('en');
          },
        ),
      ],
      child: BlocConsumer<LocalizationCubit, LocalizationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
            locale: LocalizationCubit.get(context).l,
            navigatorKey: navigatorKey,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Shawati App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: ConstColor.kMainColor),
                primaryColor: Colors.white,
                useMaterial3: true,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                ),
                fontFamily: 'Poppins'),
            home: const SplachView(),
          );
        },
      ),
    );
  }
}
