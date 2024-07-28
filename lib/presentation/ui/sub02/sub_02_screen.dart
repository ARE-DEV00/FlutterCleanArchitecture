import 'package:architecture/presentation/constants/route_path.dart';
import 'package:architecture/presentation/utils/platform_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Sub02Screen extends ConsumerStatefulWidget {
  String id;
  String? text;

  Sub02Screen({super.key, required this.id, this.text});

  @override
  _Sub02ScreenState createState() => _Sub02ScreenState();
}

class _Sub02ScreenState extends ConsumerState<Sub02Screen> {
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
              "Sub 02 Screen(${PlatformUtil.determinePlatform()})",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sub02Screen"),
            Text("id: ${widget.id}"),
            Text("text: ${widget.text}"),
            TextButton(
              onPressed: () {
                context.goNamed(RoutePath.home.name);
              },
              child: const Text('Move to HomeScreen'),
            ),
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
