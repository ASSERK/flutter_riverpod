import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testpro/features/users/presentation/view/users_screen/users_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users & Posts',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UsersScreen(),
    );
  }
}
