//responsavel por determinar em quanto tempo vai ser feito o feedback e chamr as infos para enviar no bd

import 'package:cardapio_do_bentao/model/get_db/get_cardapioDia_db.dart';
import 'package:cardapio_do_bentao/model/set_db/set_feedback_db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerFeedback {
  // static String teste = "0";
  static String _timeEnviouFeedback = '0';
  String getTimeEnviouFeedback() => _timeEnviouFeedback;

  void setTimeEnviouFeedback(String timeEnviouFeedback) =>
      _timeEnviouFeedback = timeEnviouFeedback;

  BdFeedback dbFeedback = new BdFeedback();

  pegarDataFeedback() async {
    SharedPreferences getDataFeedback = await SharedPreferences.getInstance();
    return _timeEnviouFeedback =
        await getDataFeedback.getString('informacoesDataFeedback') ?? '0';
  }

  void saveDataFeedback(data) async {
    SharedPreferences saveDataFeedback = await SharedPreferences.getInstance();
    saveDataFeedback.setString(
      "informacoesDataFeedback",
      "${data}",
    );
  }

  Future<bool> verificaCardapioDia() async {
    BdUserDia verifica = new BdUserDia();
    var resultGetCardapio = await verifica.queryCardapioDia();

    if (resultGetCardapio['cafe'] == null && resultGetCardapio['almoco']==null) {
      return false;
    }

    return true;
  }

  Future<int> verificaFeedback(nota) async {
    DateTime dataNow = DateTime.now();
    String data1 = "${dataNow.year}${dataNow.month}${dataNow.day}";

    await pegarDataFeedback();
    bool verificaGetCardapio = await verificaCardapioDia();
    print(verificaGetCardapio);
    if (int.parse(getTimeEnviouFeedback()) > int.parse(data1) ||
        getTimeEnviouFeedback() == data1) {

      return 2;
    } else if (verificaGetCardapio == true) {
      dbFeedback.queryEnviarFeedback(nota);
      saveDataFeedback(data1);

      return 1;
    }
    return 3;
  }
}
