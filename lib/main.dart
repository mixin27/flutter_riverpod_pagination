import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paginate_demo/src/hooks/use_pagination.dart';
import 'package:paginate_demo/src/product_controller.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(paginatedProductControllerProvider.notifier);
    final state = ref.watch(paginatedProductControllerProvider);
    final scrollController = usePagination(
      controller.loadMore,
      () => controller.canLoadMore(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: switch (state) {
        AsyncValue(value: var data) when data != null && data.data.isNotEmpty =>
          ListView.separated(
            controller: scrollController,
            itemBuilder: (context, index) {
              if (data.data.length == index) {
                // here we will handle isLoading and hasError and done
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                if (state.hasError) {
                  return Center(child: Text(state.error.toString()));
                }

                if (!controller.canLoadMore()) {
                  return const Center(child: Text('No more data'));
                }
              }

              final item = data.data[index];

              return ListTile(
                key: ValueKey(item.id),
                title: Text(item.title),
                subtitle: Text(item.price.toString()),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: data.data.length +
                (state.isLoading || state.hasError || !controller.canLoadMore()
                    ? 1
                    : 0),
          ),
        AsyncLoading() => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        AsyncError(:final error, :final stackTrace) => Center(
            child: Text('$error\n$stackTrace'),
          ),
        _ => const Center(child: Text('No data')),
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
