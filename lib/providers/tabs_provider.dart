import 'package:flutter/cupertino.dart';

class TabsProvider with ChangeNotifier {
  
  int _tapIndex = 0;

  final PageController _pageCtrl = PageController( initialPage: 0 );

  int get tapIndex => _tapIndex;

  PageController get pageCtrl => _pageCtrl;

  set tapIndex( int val ) {
    _tapIndex = val;
    _pageCtrl.animateToPage(
      val,
      duration: const Duration( milliseconds: 250 ),
      curve: Curves.easeIn
    );
    notifyListeners();
  }

}