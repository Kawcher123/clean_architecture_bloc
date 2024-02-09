
import 'package:clean_architecture_bloc/application_layer/core/services/theme_service.dart';
import 'package:clean_architecture_bloc/application_layer/pages/advice/advice_page.dart';
import 'package:clean_architecture_bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as di; // di = dependency injection

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const AdvicerPageWrapperProvider(),
      );
    });
  }
}