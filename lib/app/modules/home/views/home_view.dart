import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Query(
          options: QueryOptions(
            document: gql(controller.readRepositories),
            variables: const {'nRepositories': 20},
            //pollInterval: const Duration(seconds: 10),
          ),
          builder: (
            QueryResult result, {
            VoidCallback? refetch,
            FetchMore? fetchMore,
          }) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const Text('Loading');
            }

            List? repositories =
                result.data?['viewer']?['repositories']?['nodes'];

            if (repositories == null) {
              return const Text('No repositories');
            }

            final FetchMoreOptions opts = FetchMoreOptions(
              updateQuery: (previousResultData, fetchMoreResultData) {
                final repos = [
                  ...previousResultData?['viewer']?['repositories']?['nodes'],
                  ...fetchMoreResultData?['viewer']?['repositories']?['nodes'],
                ];

                fetchMoreResultData?['viewer']?['repositories']?['nodes'] =
                    repos;

                return fetchMoreResultData;
              },
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: repositories.length,
                  itemBuilder: (_, index) {
                    final repository = repositories[index];

                    return Text(repository['name'] ?? '');
                  },
                ),
                TextButton(
                  onPressed: fetchMore == null ? null : () => fetchMore(opts),
                  child: const Text("Load More"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
