import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:docdoctes/screens/RegistrarRota.dart';
import 'esquecisenha.dart';
import 'TerapPage.dart';
import 'package:docdoctes/model/user.dart';
import 'PacientePage.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PacientePage()));
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doUserLogin() async {
    final username = nameController.text.trim();
    final password = passwordController.text.trim();

    final user = ParseUser(username, password, null);

    var response = await user.login();
    User users = User();
    users.email = "adminterap@gmail.com";
    users.senha = 'adminterap';
    if (users.email == username && users.senha == password) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TerapPage()));
    } else {
      if (response.success) {
        showSuccess("Logado com sucesso!");
      } else {
        showError(response.error.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2),
                    child: new Image.asset(
                      'imagens/bb.png',
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuário',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EsqueciSenhaRota(),
                      ),
                    );
                    //forgot password screen
                  },
                  textColor: Colors.black,
                  child: Text('Esqueci a senha'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.lightBlue,
                      child: Text('Entrar'),
                      onPressed: () {
                        doUserLogin();
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Ainda não tem uma conta?'),
                    FlatButton(
                      textColor: Colors.lightBlue,
                      child: Text(
                        'Registrar',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrarRota(),
                          ),
                        );
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
