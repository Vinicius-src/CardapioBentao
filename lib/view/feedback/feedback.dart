// ignore_for_file: deprecated_member_use

import 'package:cardapio_do_bentao/controller/Feedback/feedback_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cardapio_do_bentao/values/custonColor.dart';
import 'package:google_fonts/google_fonts.dart';

class feedback extends StatefulWidget {
  const feedback({Key? key}) : super(key: key);

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  ControllerFeedback fedbackController = new ControllerFeedback();
  var nota = 3;
  double? value;
  // ignore: unused_field
  double? _ratingValue;

  //array
  var imgEmogi = {
    1: Image.asset("images/emogi1.png", width: 210, height: 210),
    2: Image.asset("images/emogi2.png", width: 210, height: 210),
    3: Image.asset("images/emogi3.png", width: 210, height: 210),
    4: Image.asset("images/emogi4.png", width: 210, height: 210),
    5: Image.asset("images/emogi5.png", width: 210, height: 210),
  };

  var msg = {
    1: Text("Muito Insatisfeito!",
        style: GoogleFonts.secularOne().copyWith(
            fontSize: 25, color: Colors.black87, fontWeight: FontWeight.w100),
        textAlign: TextAlign.center),
    2: Text("Insatisfeito!",
        style: GoogleFonts.secularOne().copyWith(
            fontSize: 25, color: Colors.black87, fontWeight: FontWeight.w100),
        textAlign: TextAlign.center),
    3: Text("Bom!",
        style: GoogleFonts.secularOne().copyWith(
            fontSize: 25, color: Colors.black87, fontWeight: FontWeight.w100),
        textAlign: TextAlign.center),
    4: Text("Muito Bom!",
        style: GoogleFonts.secularOne().copyWith(
            fontSize: 25, color: Colors.black87, fontWeight: FontWeight.w100),
        textAlign: TextAlign.center),
    5: Text("Excelente!",
        style: GoogleFonts.secularOne().copyWith(
            fontSize: 25, color: Colors.black87, fontWeight: FontWeight.w100),
        textAlign: TextAlign.center),
  };

  Widget buildSheet() => Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 150)),
          Container(
              child: Center(
                  child: Text("Obrigado ;D",
                      style: GoogleFonts.secularOne(fontWeight: FontWeight.w500)
                          .copyWith(fontSize: 40)))),
          Padding(padding: EdgeInsets.only(top: 25)),
          Text(
            "A sua avaliração é muito importante para nós!",
            style: GoogleFonts.secularOne(fontWeight: FontWeight.w500)
                .copyWith(fontSize: 25, color: Color.fromARGB(200, 0, 0, 0)),
            textAlign: TextAlign.center,
          )
        ],
      );

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Feedback",
              textAlign: TextAlign.end,
              style: GoogleFonts.laila(
                textStyle: Theme.of(context).textTheme.headline6,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            toolbarHeight: 500,
            leading: Padding(
                padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
                child: Image.asset(
                  "images/cardapioBentaoBar.png",
                  height: 50,
                  width: 50,
                )),
            leadingWidth: 100,
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            elevation: 3,
          ),
        ),
        body: ListView(
          children: <Widget>[
            //ListView da scrow pra rola a tela
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                  child: Text(
                "Você está satisfeito com a refeição de hoje? \n deixe sua avaliação!",
                style: GoogleFonts.secularOne()
                    .copyWith(fontSize: 25, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              )),
            ),
            Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(child: imgEmogi[nota])),
            Container(padding: EdgeInsets.only(top: 25), child: msg[nota]),
            Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              child: Center(
                  child: RatingBar.builder(
                itemSize: 50,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 1),
                itemBuilder: (context, _) => Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {
                  setState(() {
                    nota = value.toInt();
                  });
                },
              )),
            ),

            Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              padding: EdgeInsets.only(left: 100, right: 100),
              child: ElevatedButton(
                onPressed: () async {
                  if (await fedbackController.verificaFeedback(nota)==1) {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        context: context,
                        builder: (context) => buildSheet());
                  } else if(await fedbackController.verificaFeedback(nota)==2) {
                    ScaffoldMessenger.of(context).showSnackBar(avaliado);
                  }else if(await fedbackController.verificaFeedback(nota)==3){
                    ScaffoldMessenger.of(context).showSnackBar(semCardapio);
                  }
                },
                child: Text(
                  'Avaliar',
                  style: GoogleFonts.secularOne(fontWeight: FontWeight.w500)
                      .copyWith(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: CustomColors().getActivePrimaryButtonColor(),
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
              ),
            ),
          ],
        ));
  }
}

final avaliado = SnackBar(
  content: Text('Você já avaliou o prato hoje, Obrigado!',
      textAlign: TextAlign.center),
  backgroundColor: Colors.green,
);
final semCardapio = SnackBar(
  content: Text('hoje não possui cardápio para ser avaliado!',
      textAlign: TextAlign.center),
  backgroundColor: Colors.red,
);
