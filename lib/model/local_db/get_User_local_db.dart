import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserGetMemoria {
  Future<List<int>> pegarUserMemoria() async {
    SharedPreferences getDataFeedback = await SharedPreferences.getInstance();

    String InformacoesUsuario =
        await getDataFeedback.getString('IformacoesUsuario') ?? " ";

    Map<String, dynamic> JsonInformacoesUsuario =
        jsonDecode(InformacoesUsuario);

    int periodo = int.parse(JsonInformacoesUsuario['periodo']);

    int curso = int.parse(JsonInformacoesUsuario['curso']);

    List<int> dados = [periodo, curso];

    return dados;
  }
}
