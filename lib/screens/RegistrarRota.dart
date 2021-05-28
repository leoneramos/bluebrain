import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class RegistrarRota extends StatefulWidget {
  @override
  _RegistrarRotaState createState() => _RegistrarRotaState();
}

GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _RegistrarRotaState extends State<RegistrarRota> {
  List<bool> isSelected = [true, false];
  TextEditingController registroEmailController = TextEditingController();
  TextEditingController registroSenhaController = TextEditingController();
  TextEditingController registroUserController = TextEditingController();
  TextEditingController registroRoleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void showSuccess() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Sucesso!"),
            content: const Text("Usuário criado com sucesso!"),
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

    void doUserRegistration() async {
      final email = registroEmailController.text.trim();
      final password = registroSenhaController.text.trim();
      final usuario = registroUserController.text.trim();

      final usertuned = ParseUser.createUser(usuario, password, email);

      var response = await usertuned.signUp();

      if (response.success) {
        showSuccess();
      } else {
        showError(response.error.message);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Blue Brain - Registar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(50),
                  child: Text(
                    'REGISTRAR',
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(50),
                  child: Container(
                    alignment: Alignment.center,
                    child: ToggleButtons(
                      isSelected: isSelected,
                      selectedColor: Colors.lightBlue,
                      children: <Widget>[
                        Icon(Icons.child_care),
                        Icon(Icons.medical_services)
                      ],
                      onPressed: (int newIndex) {
                        setState(() {
                          for (int index = 0;
                              index < isSelected.length;
                              index++) {
                            if (index == newIndex) {
                              isSelected[index] = true;
                            } else {
                              isSelected[index] = false;
                            }
                          }
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: registroUserController,
                    decoration: InputDecoration(
                      labelText: 'Usuário',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.lightBlue),
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: registroEmailController,
                    decoration: InputDecoration(
                      labelText: 'EMail',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.lightBlue),
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: registroSenhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.lightBlue),
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: 40,
                    child: ElevatedButton(
                        child: Text('Registar'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.lightBlue),
                        ),
                        onPressed: () => doUserRegistration()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
