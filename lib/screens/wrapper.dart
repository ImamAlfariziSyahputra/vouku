import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vouku/models/RealUser.dart';
import 'package:vouku/screens/authenticate/authenticate.dart';
import 'package:vouku/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<RealUser>(context);

    // return either Home or Authenticate Widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }

  }
}
