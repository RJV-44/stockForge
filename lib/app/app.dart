import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'router/route_names.dart';
import 'theme/app_theme.dart';
import '../core/constants/app_constants.dart';
import '../core/services/navigation_service.dart';

class HardwareManagementApp extends StatelessWidget {
  const HardwareManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: RouteNames.initial,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
