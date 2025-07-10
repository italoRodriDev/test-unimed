class DengueCaseModel {
  final String? idAgravo;
  final String? csSexo;
  final String? csRaca;
  final String? hospitaliz;
  final String? febre;
  final String? mialgia;

  DengueCaseModel({
    this.idAgravo,
    this.csSexo,
    this.csRaca,
    this.hospitaliz,
    this.febre,
    this.mialgia,
  });

  factory DengueCaseModel.fromJson(Map<String, dynamic> json) {
    return DengueCaseModel(
      idAgravo: json['id_agravo'],
      csSexo: json['cs_sexo'],
      csRaca: json['cs_raca'],
      hospitaliz: json['hospitaliz'],
      febre: json['febre'],
      mialgia: json['mialgia'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idAgravo': idAgravo,
      'agravo': agravo,
      'sexo': sexo,
      'raca': raca,
      'isHospitalizado': isHospitalizado,
      'temFebre': temFebre,
      'temMialgia': temMialgia,
    };
  }

  /// Mapeamento de sexo
  String get sexo {
    switch (csSexo) {
      case 'M':
        return 'Masculino';
      case 'F':
        return 'Feminino';
      default:
        return 'Não informado';
    }
  }

  /// Mapeamento de raça
  String get raca {
    switch (csRaca) {
      case '1':
        return 'Branca';
      case '2':
        return 'Preta';
      case '3':
        return 'Amarela';
      case '4':
        return 'Parda';
      case '5':
        return 'Indígena';
      case '9':
        return 'Ignorado';
      default:
        return 'Não informado';
    }
  }

  /// Hospitalizado?
  bool get isHospitalizado => hospitaliz == '1';

  /// Sintomas (1 = sim, 2 = não)
  bool get temFebre => febre == '1';
  bool get temMialgia => mialgia == '1';

  /// Tipo de agravo
  String get agravo {
    switch (idAgravo) {
      case 'A90':
        return 'Dengue';
      case 'A92.0':
        return 'Chikungunya';
      case 'A928':
        return 'Zika';
      default:
        return 'Desconhecido';
    }
  }
}
