import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/config/app_routes.dart';
import 'package:noteapp/config/app_theme.dart';
import 'package:noteapp/models/note_model.dart';

Future<void> initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.log('starting services ...');
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>("notes");
  Get.log('All services started...');
}

Future<void> main() async {
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note App',
      theme: AppTheme.theme,
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
      defaultTransition: Transition.cupertino,
    );
  }
}
