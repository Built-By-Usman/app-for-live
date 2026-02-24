
import 'package:ChatHub/core/constant/app_route.dart';
import 'package:ChatHub/core/constant/app_size.dart';
import 'package:ChatHub/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/constant/app_color.dart';
import 'core/constant/app_string.dart';
import 'note_model.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('notes');
  

  

  runApp(
  MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetMaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Helvetica',
        primaryColor: AppColor.second,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.second,
          foregroundColor: AppColor.white,
        ),
        tabBarTheme: TabBarThemeData(
          indicatorColor: AppColor.white,
          labelColor: AppColor.white,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          unselectedLabelColor: AppColor.white.withOpacity(0.5),
        ),
        useMaterial3: true,
      ),
      getPages: routes,
      initialRoute: AppRoute.splash,
    );
  }
}
