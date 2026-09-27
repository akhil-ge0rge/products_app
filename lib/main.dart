import 'package:flutter/material.dart';
import 'package:products_app/core/data/network/network_api_services.dart';
import 'package:products_app/features/home/repo/home_repo.dart';
import 'package:products_app/features/home/view-model/home_view_model.dart';
import 'package:provider/provider.dart';

import 'features/home/view/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(HomeRepo(NetworkApiService())),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
