import 'package:flutter/material.dart';

import 'package:newsprovider_fernandoherrera/src/pages/tabs_page.dart';
import 'package:newsprovider_fernandoherrera/src/theme/tema.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsPage());
  }
}
