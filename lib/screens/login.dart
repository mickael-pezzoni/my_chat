import 'package:flutter/material.dart';
import '../components/signin.dart';
import '../components/signup.dart';
import '../components/login_nav_bottom_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  int tabIndex = 0;
  final _formKey = GlobalKey<FormState>();
  late List<BottomNavigationBarItem> tabHeaders;
  static List<Widget> tabContent = [SigninComponent(), SignupComponent()];
  String pseudo = '';
  @override
  void initState() {
    super.initState();
    tabHeaders = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.vpn_key),
        label: 'Signin',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_add),
        label: 'Signup',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Login')),
      body: DefaultTabController(
        length: tabHeaders.length,
        child: Scaffold(
            body: Center(child: tabContent.elementAt(tabIndex)),
            bottomNavigationBar: LoginNavButtonBar(
                tabHeader: tabHeaders,
                onIndexChange: (value) {
                  setState(() => tabIndex = value);
                })),
      ),
    );
  }
}
