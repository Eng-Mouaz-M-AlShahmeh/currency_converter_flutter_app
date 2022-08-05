/* Developed by: Eng Mouaz M. Al-Shahmeh */
class CurrencyModel {
  String? shortTitle;
  String? title;
  String? flag;
  String? factor;

  CurrencyModel({this.shortTitle, this.title, this.flag, this.factor});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    shortTitle = json['shortTitle'].toString();
    title = json['title'].toString();
    flag = json['flag'].toString();
    factor = json['factor'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['shortTitle'] = shortTitle;
    data['title'] = title;
    data['flag'] = flag;
    data['factor'] = factor;
    return data;
  }
}
