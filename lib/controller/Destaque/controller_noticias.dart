import 'package:cardapio_do_bentao/model/get_db/get_noticias.dart';

class Noticias {
  BdNoticias getNoticias = new BdNoticias();

  Future<List<String>> getLinkImg() async {
    List<Map<String, dynamic>> mapNoticias = await getNoticias.getLinkImg();

    List<String> link_banner = [];

  
      link_banner.add('${mapNoticias[0]['link_banner']}');
      link_banner.add('${mapNoticias[1]['link_banner']}');


    return link_banner;
  }
}