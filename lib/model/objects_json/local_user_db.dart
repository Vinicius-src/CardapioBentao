class Usuario {
  String? periodo;
  String? curso;

  Usuario({this.periodo, this.curso});

  Usuario.fromJson(Map<String, dynamic> json) {
    periodo = json['periodo'];
    curso = json['curso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = new Map<String, dynamic>();
    user['periodo'] = this.periodo;
    user['curso'] = this.curso;
    return user;
  }
}
