import 'package:flutter/material.dart';

class SigninComponent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  SigninComponent({Key? key}) : super(key: key);

  String getUsernameControllerValue() {
    return usernameController.text;
  }

  String getPasswirdControllerValue() {
    return passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.account_circle),
                    labelText: 'Username',
                    hintText: 'username'),
                controller: usernameController,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Veuillez saisir un username';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.vpn_key),
                    labelText: 'Password',
                    hintText: 'Password'),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Veuillez saisir un password';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, '/home',
                      arguments: getUsernameControllerValue());
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                      padding: EdgeInsets.all(8.0), child: Icon(Icons.login)),
                  Text('Signin')
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
