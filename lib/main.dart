import 'package:ecommerce_app/core/cache_manager/CacheManager.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/provider/auth_provider.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes_manager/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheManager.inti();
  configureDependencies();

  final authProvider = getIt<AuthProvider>();
  await authProvider.waitisInitialized();

  runApp(MainApp(
    provider: authProvider,
  ));
}

class MainApp extends StatelessWidget {
  final AuthProvider provider;
  const MainApp({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute:
              provider.isLoggedIn ? Routes.mainRoute : Routes.signInRoute,
        ),
      ),
    );
  }
}
