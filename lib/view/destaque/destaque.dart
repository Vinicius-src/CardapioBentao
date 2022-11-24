import 'package:cardapio_do_bentao/controller/Destaque/controller_menuDia.dart';
import 'package:cardapio_do_bentao/controller/Destaque/controller_noticias.dart';
import 'package:cardapio_do_bentao/view/destaque/menuDia.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class destaque extends StatefulWidget {
  const destaque({Key? key}) : super(key: key);

  @override
  State<destaque> createState() => _destaqueState();
}

class _destaqueState extends State<destaque> {
  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: _index);
    noticiaadd();
  }

  Noticias noticias = new Noticias();
  int _index = 0;
  late PageController pc;

  var imgNoticia = [
    Image.network(
      'https://media.discordapp.net/attachments/1006323993512517827/1042171392931663922/semimg.png',
      width: double.infinity,
      height: double.infinity,
    ),
    Image.network(
      'https://media.discordapp.net/attachments/1006323993512517827/1042171392931663922/semimg.png',
      width: double.infinity,
      height: double.infinity,
    ),
  ];

  Future<void> noticiaadd() async {
    var a = await noticias.getLinkImg();
    setState(() {
      imgNoticia[0] = Image.network(a[0]);
      imgNoticia[1] = Image.network(a[1]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Destaque",
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
                      colors: <Color>[
                        Color.fromRGBO(255, 87, 34, 1),
                        Colors.yellow
                      ]),
                ),
                height: 200,
              )),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            // ignore: deprecated_member_use
            child: Material(
                child: InkWell(
              child: Image.asset(
                'images/menuDestaque.jpg',
              ),
              onTap: () async {
                await ControllerCardapioDia().showManuDia();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ChangeNotifierProvider(
                          create: (_) => ControllerCardapioDia(),
                          child: menuDia(),
                        )),
                  ),
                );
              },
            )),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
                child: Text(
              "Notícias",
              style:
                  GoogleFonts.secularOne(fontWeight: FontWeight.w100).copyWith(
                color: Colors.black,
                fontSize: 25,
              ),
            ))),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 5),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
              ),
              items: imgNoticia.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () async {
                        var url = Uri(
                          scheme: 'https',
                          host: 'etecbentoquirino.com.br',
                          path: "/new/",
                        );
                        if (await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(urlErro);
                        }
                      },
                      child: Container(
                          padding: EdgeInsets.all(2),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: i)),
                    );
                  },
                );
              }).toList(),
            ))
      ]),
    );
  }
}

final urlErro = SnackBar(
  content: Text('Não foi possivel redirecionar!', textAlign: TextAlign.center),
  backgroundColor: Colors.redAccent,
);
