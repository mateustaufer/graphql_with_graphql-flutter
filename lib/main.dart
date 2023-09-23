import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
// import 'app/core/local_storage.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  setPathUrlStrategy();

  await Future.wait([
    // LocalStorage.init(),
    initHiveForFlutter(),
  ]);

  final HttpLink httpLink = HttpLink('https://api.github.com/graphql');

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer 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',
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(App(client: client));
}
