import 'package:flutter/material.dart';

GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class EsqueciSenhaRota extends StatelessWidget {
  TextEditingController recuperarEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blue Brain - Area de Registro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: recuperarEmailController,
                  decoration: InputDecoration(
                    labelText: 'EMail',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.lightBlue),
                  ),
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.lightBlue),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Recuperar Senha'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
