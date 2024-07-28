import 'package:architecture/presentation/constants/route_path.dart';
import 'package:architecture/presentation/utils/platform_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Sub01Screen extends ConsumerStatefulWidget {
  @override
  _Sub01ScreenState createState() => _Sub01ScreenState();
}

class _Sub01ScreenState extends ConsumerState<Sub01Screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Sub 01 Screen(${PlatformUtil.determinePlatform()})",
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
              )
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sub01Screen"),
            TextButton(onPressed: () {
              context.go(RoutePath.sub02.fullPath.replaceAll(":id", "123"), extra: {'text': 'Hello!'});
            }, child: Text('Move to Sub02Screen')),
            TextButton(onPressed: () {
              context.goNamed(RoutePath.home.name);
            }, child: Text('Move to HomeScreen')),
            TextButton(onPressed: () {
              context.pop();
            }, child: Text('Back')),
          ],
        ),
      ),
    );
  }
}
