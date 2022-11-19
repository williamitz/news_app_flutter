import 'package:flutter/material.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/screens/screens.dart';
import 'package:news_app/themes/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [

        ChangeNotifierProvider( create: (_) => ArticlesProvider() )

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const TabsScreen(),
        theme: AppTheme.darkTheme,
      ),
    );

  }
}