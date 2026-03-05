import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes_manager/route_generator.dart';


/// 1- Repository pattern
/// 2- Clean Architecture
/// 3- Bloc [State Management] || [Business Logic Component] || Handler Ui Events
/// [UI --> Bloc] --> [UseCase --> Repository] --> [Data Source]

/// [Clean Architecture || Bloc ]
///
/// * Dio || Webservice
/// * GetIt --> service locator [Dependency Injection]
/// * Toast || SnackBar || Loading
/// * Authentication [sign in || sign up]
/// * AuthHandler [store token || remove token || check token]
/// * Home

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.signInRoute,
      ),
    );
  }
}
