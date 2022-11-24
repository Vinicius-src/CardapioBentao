import 'package:cardapio_do_bentao/controller/MenuSemana/controller_menuSemana.dart';
import 'package:cardapio_do_bentao/view/feedback/feedback.dart';
import 'package:cardapio_do_bentao/view/menuSemana/menuSemana.dart';
import 'package:cardapio_do_bentao/view/destaque/destaque.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _index = 0;
  late PageController pc;
  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: _index);
  }

  setPaginaAtual(pagina) {
    setState(() {
      _index = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        scrollBehavior: null,
        controller: pc,
        children: [
          destaque(),
          ChangeNotifierProvider.value(
            value: ControllerCardapioSemana(),
            child: menuSemana(),
          ),
          feedback(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Destaque',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant), label: 'Semana'),
          BottomNavigationBarItem(
              icon: Icon(Icons.thumbs_up_down_rounded), label: 'Feedback'),
        ],
        onTap: (pagina) {
          pc.animateToPage(pagina,
              duration: Duration(milliseconds: 300), curve: Curves.linear);
        },
      ),
    );
  }
}
