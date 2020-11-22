import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _NavegacionModel()),
      ],
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModelProvider = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        currentIndex: navegacionModelProvider.numeroEvento,
        onTap: (i) {
          //print(i);
          navegacionModelProvider.numeroEvento = i;
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Para ti"),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: "Encabezados"),
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigatioModelProvider = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navigatioModelProvider.pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get numeroEvento => this._paginaActual;
  set numeroEvento(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(microseconds: 250), curve: Curves.bounceInOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
