import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';

import 'home_page.dart';
import 'login_page.dart';

class AppWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          initialRoute: '/',  //definir rota inicial
          routes: { //rota para ir para outro ponto
          '/': (context) => LoginPage(), //rota para loginpage
          '/home': (context) => HomePage()
          }
        );
      },
    );
  }
}

//tudo que eu colocar no método build irá funcionar aqui dentro, qualquer widget será construido na tela
//estilo de texto, cor do texto, tamanho da fonte
//para que ele tenha widget ele precisa herdar de alguém que tenha, no casso stateless ou statefull, por isso extendemos
//com orientação ao objeto, em seguida incrementar mais itens.

//class AppWidgets2 extends StatelessWidget {
  //@override
//  Widget build(BuildContext context) {
  //  return MaterialApp(
    //  theme: ThemeData(primarySwatch: Colors.yellow),
      //home: HomePage(),
 //   );
  //}
//}
