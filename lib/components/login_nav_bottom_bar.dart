import 'package:flutter/material.dart';

class LoginNavButtonBar extends StatefulWidget {
  List<BottomNavigationBarItem> tabHeader;
  Function onIndexChange;
  LoginNavButtonBar(
      {Key? key, required this.tabHeader, required this.onIndexChange})
      : super(key: key);

  @override
  LoginNavButtonBarState createState() => LoginNavButtonBarState();
}

class LoginNavButtonBarState extends State<LoginNavButtonBar> {
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _updateIndex(int index) {
    setState(() {
      tabIndex = index;
    });
    widget.onIndexChange(tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[400],
      backgroundColor: Theme.of(context).primaryColor,
      onTap: _updateIndex,
      currentIndex: tabIndex,
      items: widget.tabHeader,
    );
  }
}
