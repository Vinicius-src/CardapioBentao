import 'package:cardapio_do_bentao/controller/MenuSemana/controller_menuSemana.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BodyCardapio extends StatelessWidget {
  const BodyCardapio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.all(5),
        width: 300,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.elliptical(80, 58),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          color: Colors.deepOrange,
          elevation: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    Icons.free_breakfast,
                    color: Colors.black,
                    size: 45,
                  ),
                  title: Text(
                    'Café da manhã 8h às 9h',
                    style: GoogleFonts.secularOne(fontWeight: FontWeight.w100)
                        .copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  )),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(0),
                child: Consumer<ControllerCardapioSemana>(
                  builder: ((context, value, child) {
                    return Text(
                      value.getCafe,
                      style: GoogleFonts.aBeeZee(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.all(5),
        width: 300,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.elliptical(80, 60),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          color: Colors.deepOrange,
          elevation: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    Icons.restaurant_menu_sharp,
                    color: Colors.black,
                    size: 45,
                  ),
                  title: Text(
                    'Almoço 11h às 12h',
                    style: GoogleFonts.secularOne(fontWeight: FontWeight.w100)
                        .copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  )),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                width: double.infinity,
                margin: EdgeInsets.all(0),
                child: Consumer<ControllerCardapioSemana>(
                  builder: ((context, value, child) {
                    return Text(
                      value.getAlmoco,
                      style: GoogleFonts.aBeeZee(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.justify,
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.all(5),
        width: 300,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.elliptical(80, 60),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          color: Colors.deepOrange,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    Icons.lunch_dining_rounded,
                    color: Colors.black,
                    size: 45,
                  ),
                  title: Text(
                    'Lanche 14h30 às 15h30',
                    style: GoogleFonts.secularOne(fontWeight: FontWeight.w100)
                        .copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  )),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(0),
                child: Consumer<ControllerCardapioSemana>(
                    builder: ((context, value, child) {
                  return Text(
                    value.getLanche,
                    style: GoogleFonts.aBeeZee(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  );
                })),
              )
            ],
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.all(5),
        width: 300,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.elliptical(80, 60),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          color: Colors.deepOrange,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    Icons.local_dining_rounded,
                    color: Colors.black,
                    size: 45,
                  ),
                  title: Text(
                    'Jantar 19h às 20h',
                    style: GoogleFonts.secularOne(fontWeight: FontWeight.w100)
                        .copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  )),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                margin: EdgeInsets.all(0),
                child: Consumer<ControllerCardapioSemana>(
                    builder: ((context, value, child) {
                  return Text(
                    value.getJantar,
                    style: GoogleFonts.aBeeZee(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  );
                })),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
