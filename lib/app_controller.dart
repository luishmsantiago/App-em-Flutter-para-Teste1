//aqui estará a regra de negócio, mudará o tema

import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  //changenotifier é como um setstates, mas apenas para quem está usando código de programação e não tela.
  //essa classe terá que estar no homepage e no app widget, porém para isso é preciso de uma condição:
  static AppController instance =
      AppController(); // estanciar numa classe estática para não gerar problemas
  bool isDarkTheme = false;
  changeTheme() {
    isDarkTheme =
        !isDarkTheme; //! serve para fazer um bool se tornar false ou true
    notifyListeners(); //notificar quem estiver escutando com som
  }
}
