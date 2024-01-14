import 'package:architecture/presentation/utils/PlatformUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:architecture/domain/usecase/sample_use_case.dart';

class Home extends ConsumerWidget {
  final textProvider = StateProvider<String>((ref) => "");
  final myProvider = FutureProvider.autoDispose((ref) {
    return SampleUseCase().createSample(
        "Flutter Clean Architecture(${PlatformUtils.determinePlatform()})");
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FutureProvider의 상태를 구독합니다.
    final sampleEntity = ref.watch(myProvider);

    // StateProvider의 상태를 구독합니다.
    final text = ref.watch(textProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(
          "Flutter Clean Architecture(${PlatformUtils.determinePlatform()})",
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000)),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xFFFFFFFF),
          child: Column()),
    );
  }
}
