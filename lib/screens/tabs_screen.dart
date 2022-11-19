import 'package:flutter/material.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/providers/tabs_provider.dart';
import 'package:news_app/screens/screens.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TabsProvider(),
      child: const Scaffold(
    
        body: _TabsBody(),
    
        bottomNavigationBar: _TabsNavigation(),
    
      ),
    );
  }
}

class _TabsNavigation extends StatelessWidget {
  const _TabsNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TabsProvider tabprov = Provider.of<TabsProvider>(context);

    return BottomNavigationBar(
      onTap: (value) => tabprov.tapIndex = value,
      currentIndex: tabprov.tapIndex,
      items: const [

        BottomNavigationBarItem(
          icon: Icon( Icons.person_outline ),
          label: 'Para tì'
        ),

        BottomNavigationBarItem(
          icon: Icon( Icons.public ),
          label: 'Emcabezados'
        )

      ],
    );
  }
}

class _TabsBody extends StatelessWidget {
  const _TabsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TabsProvider tabprov = Provider.of<TabsProvider>(context);
    // final ArticlesProvider articlesprov = Provider.of<ArticlesProvider>(context);

    return PageView(
      // physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      controller: tabprov.pageCtrl,
      children: [

        const Tabs1Screen(),

        const Tabs2Screen()

      ],

    );
  }
}