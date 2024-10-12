class RegExpression{


  final RegExp NAME_VALIDATION_REGEX = RegExp(r"\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+");
  final RegExp PHONE_NUMBER_VALIDATION_REGEX = RegExp(r"^(?:\+88|88)?(01[3-9]\d{8})$");
  final RegExp EMAIL_VALIDATION_REGEX = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );



}