import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'modules/home/bindings/home_binding.dart';
import 'modules/home/views/home_view.dart';
import 'routes/app_pages.dart';

class App extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;

  const App({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: GetMaterialApp(
        title: 'Exploradores',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        transitionDuration: const Duration(seconds: 0),
        defaultTransition: Transition.noTransition,
        locale: const Locale('pt', 'BR'),
        supportedLocales: const [Locale('pt', 'BR'), Locale('en', 'US')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        unknownRoute: AppPages.routes.singleWhere(
          (page) => page.name == '/',
          orElse: () => GetPage(
            name: '/',
            page: () => const HomeView(),
            binding: HomeBinding(),
          ),
        ),
        initialRoute: Routes.home,
        getPages: AppPages.routes,
      ),
    );
  }
}
