import 'package:cardapio_do_bentao/controller/MenuSemana/controller_menuSemana.dart';
import 'package:cardapio_do_bentao/view/menuSemana/widget_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class menuSemana extends StatefulWidget {
  const menuSemana({Key? key}) : super(key: key);

  @override
  State<menuSemana> createState() => _menuSemanaState();
}

class _menuSemanaState extends State<menuSemana> {
  final CalendarWeekController _controller = CalendarWeekController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            toolbarHeight: 500,
            title: Text(
              'Cardàpio',
              style: GoogleFonts.laila(
                textStyle: Theme.of(context).textTheme.headline6,
                fontWeight: FontWeight.w700,
                color: Colors.orange.shade900,
                fontSize: 30,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 1)
                  ]),
                  child: CalendarWeek(
                    controller: _controller,
                    height: 130,
                    showMonth: false,
                    minDate: DateTime.now().add(
                      Duration(days: -3),
                    ),
                    maxDate: DateTime.now().add(
                      Duration(days: 3),
                    ),
                    onDatePressed: (DateTime datetime) {
                      String a =
                          "${_controller.selectedDate.year}-${_controller.selectedDate.month}-${_controller.selectedDate.day}";

                      Provider.of<ControllerCardapioSemana>(context,
                              listen: false)
                          .showMenuSemana(a);
                    },
                    monthViewBuilder: (DateTime time) => Align(
                      alignment: FractionalOffset.center,
                      child: Row(children: [
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          DateFormat.yMMMM().format(time),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ),
                    decorations: [
                      DecorationItem(
                          decorationAlignment: FractionalOffset.bottomRight,
                          date: DateTime.now(),
                          decoration: Icon(
                            Icons.today,
                            color: Colors.blue,
                          )),
                    ],
                  )),
              Expanded(child: BodyCardapio()),
            ]),
      ),
    );
  }
}
