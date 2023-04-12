import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    //precisamos criar uma classe que será retornada e modificada
    return HomePageState();
  } //substituirá o container e o center

}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(40), //cortar a borda do widget de forma circular com R=40
              child: Image.network('https://i.pinimg.com/280x280_RS/6c/dc/8d/6cdc8de55c4677514b042e6a3c2e6f38.jpg')), //imagem do cabeçalho buscada da internet.
            accountName: Text ('Luis Henrique'), accountEmail: Text('lhg9312@hotmail.com')), //aparecer cabeçalho do usuário
          ListTile(
            //lista já pré-produzida
            leading: Icon(Icons.home),
            title: Text('Inicio'), //texto de título
            subtitle: Text('Tela de início'), //texto subtitulo
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          ListTile(
            //lista já pré-produzida
            leading: Icon(Icons.home),
            title: Text('Logout'), //texto de título
            subtitle: Text('Finalizar sessão'), //texto subtitulo
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],
      )),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          CustomSwitch(), //código será reaproveitado na barra superior
        ], //botões que ficam na lateral direita
      ),
      body: Container(
          //poder alargar e posicionar, possui propriedade de altura e largura
          width: double.infinity, //aumentar largura e altura ao mesmo tempo
          height: double.infinity, //posicionando assim ele no centro da tela
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center, //constante para alinhar o eixo principal
            children: [
              //como todos os filhos da coluna serão alinhados
              Text('Contador: $counter'), //aqui dentro terá uma widget
              Container(height: 10), //Container de distanciamento
              CustomSwitch(), //puxará o código de baixo para deixar aqui mais limpo e fará a mesma coisa
              Container(height: 50), //Container de distanciamento
              Row(
                //fazer linhas dentro de colunas
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //alinhamento do row
                children: [
                  Container(
                      //fazer containers quadrados
                      width: 50,
                      height: 50,
                      color: Colors.blueGrey.shade100,
                      child: Text(
                        'Aqui ficarão as informações das ...',
                        style: TextStyle(fontSize: 40),
                      )),
                  Container(
                    //fazer containers quadrados
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  ),
                  Container(
                    //fazer containers quadrados
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  )
                ],
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              counter++;
            },
          );
        }, //colocar uma função aqui
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  //só de digitar stl já aparece a opção de criar toda a estrutura de widget
  @override //aqui o código irá fazer a mesma coisa
  Widget build(BuildContext context) {
    return Switch(
        //Barra de mudança para temas e outros
        value: AppController.instance.isDarkTheme, //o valor da chave ligada
        onChanged: (value) {
          //recebe valor buleano e chave de modificação com valor ali.
          print(value); //mostrar na tela a modificação
          AppController.instance.changeTheme();
        });
  }
}

//class HomePageState extends State<HomePage> {
//int counter = 0;
//@override
//Widget build(BuildContext context) {
//  return Container(
//    child: Align(
//      alignment: Alignment.bottomCenter,
//    child: GestureDetector(
//      child: Text('Contador teste: $counter'),
//    onTap: () {
//    setState(() {
//    counter++;
//  });
// })));
//}
//}
