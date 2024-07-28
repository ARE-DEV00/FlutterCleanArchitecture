import 'package:architecture/presentation/constants/route_path.dart';
import 'package:architecture/presentation/utils/platform_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:architecture/domain/usecase/sample_use_case.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  final textProvider = StateProvider<String>((ref) => "");
  final myProvider = FutureProvider.autoDispose((ref) {
    return SampleUseCase().createSample(
        "Flutter Clean Architecture(${PlatformUtil.determinePlatform()})");
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FutureProvider의 상태를 구독합니다.
    final sampleEntity = ref.watch(myProvider);

    // StateProvider의 상태를 구독합니다.
    final text = ref.watch(textProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Flutter Clean Architecture(${PlatformUtil.determinePlatform()})",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    context.goNamed(RoutePath.sub01.name);
                  },
                  child: Text("Move Sub01Screen")),
              TextButton(
                  onPressed: () {
                    context.go(
                        RoutePath.sub02.fullPath.replaceAll(":id", "123"),
                        extra: {'text': 'Hello!'});
                  },
                  child: Text("Move Sub02Screen")),
            ],
          )),
    );
  }
}
