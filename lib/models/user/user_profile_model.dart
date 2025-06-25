import 'package:ltdmed/goodies/server_ip.dart';

class UserProfileModel {
  String userId;
  String fullname;
  String cccdnumber;
  String cmndnumber;
  String dateofbirth;
  String dateofissued;
  String address;
  String phonenumber;
  String gender;
  String dbName = 'user_profile';

  static UserProfileModel? _instance;

  UserProfileModel._({
    required this.userId,
    required this.fullname,
    required this.cccdnumber,
    required this.cmndnumber,
    required this.dateofbirth,
    required this.dateofissued,
    required this.address,
    required this.phonenumber,
    required this.gender,
  });

  static UserProfileModel get instance {
    if (_instance == null) {
      initialize({});
    }
    return _instance!;
  }

  static void initialize(Map<String, dynamic> json) {
    _instance = UserProfileModel._(
      userId: json['userId'] ?? '',
      fullname: json['fullname'] ?? '',
      cccdnumber: json['cccdnumber'] ?? '',
      cmndnumber: json['cmndnumber'] ?? '',
      dateofbirth: json['dateofbirth'] ?? '',
      dateofissued: json['dateofissued'] ?? '',
      address: json['address'] ?? '',
      phonenumber: json['phonenumber'] ?? '',
      gender: json['gender'] ?? '',
    );
  }

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    _instance = UserProfileModel._(
      userId: json['userId'] ?? '',
      fullname: json['fullname'] ?? '',
      cccdnumber: json['cccdnumber'] ?? '',
      cmndnumber: json['cmndnumber'] ?? '',
      dateofbirth: json['dateofbirth'] ?? '',
      dateofissued: json['dateofissued'] ?? '',
      address: json['address'] ?? '',
      phonenumber: json['phonenumber'] ?? '',
      gender: json['gender'] ?? '',
    );
    return _instance!;
  }

  static void clear() {
    _instance = null;
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'fullname': fullname,
      'cccdnumber': cccdnumber,
      'cmndnumber': cmndnumber,
      'dateofbirth': dateofbirth,
      'dateofissued': dateofissued,
      'address': address,
      'phonenumber': phonenumber,
      'gender': gender,
    };
  }

  Future<void> save() async {
    var item = await PocketBaseServer.instance.createItem(dbName, toJson());
    print('UserProfileModel saved: ${item.id}');
  }
}

// example create body
final body = <String, dynamic>{
  "userId": "test",
  "fullname": "test",
  "cccdnumber": "test",
  "cmndnumber": "test",
  "dateofbirth": "test",
  "dateofissued": "test",
  "address": "test",
  "phonenumber": "test",
  "gender": "test",
};
