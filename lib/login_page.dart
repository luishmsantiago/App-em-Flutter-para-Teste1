import 'package:flutter/material.dart';
import 'package:ola_mundo/home_page.dart';

class LoginPage extends StatefulWidget {
  //criamos um stf - statefull para início
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

Widget _body () {
  return SingleChildScrollView ( //dá scroll para qualquer child que estiver dentro dele
        child: SizedBox(
      width: MediaQuery.of(context).size.width, //pegará as informações que estão no materialapp sobre o tamanho da tela, etc
      height: MediaQuery.of(context).size.height, //o mesmo do acima
      child: Padding(     //padding para se afastar da borda da tela
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //alinhado ao centro
          children: [
            Container(
              width: 200, //adicionar tamanho
              height: 200,
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(height: 50,), //adicionar tamanho
            Card(
              child: Padding(
                padding: const EdgeInsets.only(left:1, right: 1, top: 1, bottom: 1 ),
                child: Column(
                  children: [
                    TextField( //espaço para digitação - email
                  onChanged: (text) {
                    //as letras digitadas serão recebidas por algo em seguida
                    email = text; //quando a pessoa adicionar a variavel email ele vai adicionar a variavel email
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      //decoração da barra de digitação
                      labelText: 'Email',
                      border: OutlineInputBorder() //adicionar borda
                      )),
            SizedBox(height: 10, ),
            TextField(      //espaço para digitação - senha
                onChanged: (text) {   //as letras digitadas serão recebidas por algo em seguida
                    password = text; //quando a pessoa adicionar a variavel password ele vai adicionar a variavel password
                  },
                  obscureText: true,    //texto não aparecerá na senha
                  decoration: InputDecoration(  //decoração da barra de digitação
                      labelText: 'Password',
                      border: OutlineInputBorder() //adicionar borda
                      )),
                  SizedBox(height: 15,),
                  ],),
              ),),
            ElevatedButton(onPressed: () {
              if(email == 'lhg9312@hotmail.com' && password == '15923600Ll') {
                Navigator.of(context).pushNamed('/home'); //suficiente para passar para rota home 
              } else {
                print('Login inválido');
              }
            }, 
            child: Text('Entrar', style: TextStyle (fontSize: 25), textAlign: TextAlign.end,),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,      //cor do botão
              onPrimary: Colors.deepPurpleAccent, //cor da letra
              padding: EdgeInsets.all(10.0),
              minimumSize: Size(360, 70),
            )     
           ),          
          ],
        ),
      ),
    ));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold( //sem appbar, usando Material Scaffold  
      body: Stack( //vai empilhando itens
        children: [
        SizedBox(  //pode ser container também
        height: MediaQuery.of(context).size.height, //para esticar altura tentando aumentar para a tela toda
        child: Image.asset('assets/images/background.jpg', fit: BoxFit.cover,)), //imagem local de background
        Container(
          color: Colors.black.withOpacity(0.2) //adicionar opaticidade ao background
        ),
        _body(), //todos os itens do widget _body acima
      ]));
  }
}
