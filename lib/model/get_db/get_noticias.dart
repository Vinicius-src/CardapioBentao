import 'package:cardapio_do_bentao/config/connection_db.dart';

class BdNoticias {
  var dataBase = new connectionDB();

  Future<List<Map<String, dynamic>>> getLinkImg() async {
    String sql = "SELECT link_banner FROM noticias";

    List<Map<String, dynamic>> resultadoLinkImg = [];

    await dataBase.getConnection().then((conn) async {
      await conn.query(sql).then((results) {
        for (var getResults in results) {
          resultadoLinkImg.add(getResults.fields);
        }
      }).onError((error, stackTrace) {
        return null;
      });

      conn.close();
    });

    return resultadoLinkImg;
  }
}
