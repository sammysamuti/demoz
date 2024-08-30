import 'package:demoz/models/translation_model.dart';

class CurrenciesModel {
  final bool? success;
  final List<Currency>? data;

  CurrenciesModel({
    this.success,
    this.data,
  });

  factory CurrenciesModel.fromJson(Map<String, dynamic> json) =>
      CurrenciesModel(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Currency>.from(
                json["data"]!.map((x) => Currency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Currency {
  final int? id;
  final TranslationModel? name;
  final String? code;

  Currency({
    this.id,
    this.name,
    this.code,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        name: json["name"] == null
            ? null
            : TranslationModel.fromJson(json["name"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name?.toJson(),
        "code": code,
      };
}
