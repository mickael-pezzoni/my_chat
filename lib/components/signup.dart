import 'package:flutter/material.dart';

class SignupComponent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailCotnroller = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  SignupComponent({Key? key}) : super(key: key);

  String getEmailForm() {
    return emailCotnroller.text;
  }

  String getUsernameForm() {
    return usernameController.text;
  }

  String getPasswordFormValue() {
    return passwordController.text;
  }

  String getConfirmPassWordValue() {
    return confirmPasswordController.text;
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
                      suffixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      hintText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: usernameController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.vpn_key),
                      labelText: 'Username',
                      hintText: 'username'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailCotnroller,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter an username';
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter an password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.vpn_key),
                      labelText: 'Confirmation password',
                      hintText: 'Confirm password'),
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'You must confirm your password';
                    }
                    if (value != getPasswordFormValue()) {
                      return 'Confirmation password does not match';
                    }
                    return null;
                  },
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Navigator.pushNamed(context, '/home',
                  //     arguments: getUsernameControllerValue());
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.person_add)),
                  Text('Signup')
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
