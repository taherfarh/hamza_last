class CreateAccountBankParams {
  String? title;
  String? number;
  String? IBAN;
  String? bank;

  CreateAccountBankParams({
    this.title,
    this.number,
    this.IBAN,
    this.bank,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'number': number,
      'IBAN': IBAN,
      'bank': bank,
    };
  }
}
