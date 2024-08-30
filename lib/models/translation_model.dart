class TranslationModel {
  final String? textAm;
  final String? textEn;

  TranslationModel({
    this.textAm,
    this.textEn,
  });

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      TranslationModel(
        textAm: json["text_am"],
        textEn: json["text_en"],
      );

  Map<String, dynamic> toJson() => {
        "text_am": textAm,
        "text_en": textEn,
      };
}
