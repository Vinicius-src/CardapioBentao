import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/Destaque/controller_menuDia.dart';

class menuDia extends StatefulWidget {
  const menuDia({Key? key}) : super(key: key);

  @override
  State<menuDia> createState() => _menuDiaState();
}

class _menuDiaState extends State<menuDia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Menu do dia",
              textAlign: TextAlign.end,
              style: GoogleFonts.laila(
                textStyle: Theme.of(context).textTheme.headline6,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            toolbarHeight: 500,
            leadingWidth: 80,
            flexibleSpace: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[Colors.deepOrange, Colors.yellow]),
                  ),
                  height: 200,
                )),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
          ),
        ),
        body: ListView(children: <Widget>[
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
                        style:
                            GoogleFonts.secularOne(fontWeight: FontWeight.w100)
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
                    child: Consumer<ControllerCardapioDia>(
                      builder: ((context, value, child) {
                        return FutureBuilder<String>(
                            future: value.getCafe,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  "${snapshot.data}",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.justify,
                                );
                              } else if (snapshot.hasError) {
                                return Text(
                                  "${snapshot.hasError}",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.justify,
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            });
                      }),
                    ),
                  ),
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
                        style:
                            GoogleFonts.secularOne(fontWeight: FontWeight.w100)
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
                    child: Consumer<ControllerCardapioDia>(
                      builder: ((context, value, child) {
                        return FutureBuilder<String>(
                            future: value.getAlmoco,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  "${snapshot.data}",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.justify,
                                );
                              } else if (snapshot.hasError) {
                                return Text(
                                  "${snapshot.hasError}",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.justify,
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            });
                      }),
                    ),
                  ),
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
                        style:
                            GoogleFonts.secularOne(fontWeight: FontWeight.w100)
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
                    child: Consumer<ControllerCardapioDia>(
                      builder: ((context, value, child) {
                        return FutureBuilder<String>(
                            future: value.getLanche,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  "${snapshot.data}",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.justify,
                                );
                              } else if (snapshot.hasError) {
                                return Text(
                                  "${snapshot.hasError}",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.justify,
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            });
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
                        Icons.local_dining_rounded,
                        color: Colors.black,
                        size: 45,
                      ),
                      title: Text(
                        'Jantar 19h às 20h',
                        style:
                            GoogleFonts.secularOne(fontWeight: FontWeight.w100)
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
                    child: Consumer<ControllerCardapioDia>(
                      builder: ((context, value, child) {
                        return FutureBuilder<String>(
                            future: value.getJantar,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  "${snapshot.data}",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.justify,
                                );
                              } else if (snapshot.hasError) {
                                return Text(
                                  "${snapshot.hasError}",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.justify,
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            });
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
