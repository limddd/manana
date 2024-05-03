class MananaModel {
  final String ko, en;
  MananaModel.fromJson(Map<String, dynamic> json)
      : ko = json['ko'],
        en = json['en'];
}
