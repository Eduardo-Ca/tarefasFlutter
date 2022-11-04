import 'package:flutter/cupertino.dart';


//dark temaa------
class AppController extends ChangeNotifier{

  static AppController instance = AppController();

  bool IsDarkTheme = false;
  changeTheme(){
    IsDarkTheme = !IsDarkTheme;
    notifyListeners();
    
  }
}
