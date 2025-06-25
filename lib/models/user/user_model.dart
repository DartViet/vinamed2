class UserModel {
  final String avatar;
  final String collectionId;
  final String collectionName;
  final DateTime created;
  final String email;
  final bool emailVisibility;
  final String id;
  final String name;
  final DateTime updated;
  final bool verified;

  static UserModel? _instance;

  UserModel._({
    required this.avatar,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.email,
    required this.emailVisibility,
    required this.id,
    required this.name,
    required this.updated,
    required this.verified,
  });

  static UserModel get instance {
    if (_instance == null) {
      initialize({});
    }
    return _instance!;
  }

  static void initialize(Map<String, dynamic> json) {
    _instance = UserModel._(
      avatar: json['avatar'] ?? '',
      collectionId: json['collectionId'] ?? '',
      collectionName: json['collectionName'] ?? '',
      created: DateTime.parse(json['created'] ?? DateTime.now().toString()),
      email: json['email'] ?? '',
      emailVisibility: json['emailVisibility'] ?? false,
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      updated: DateTime.parse(json['updated'] ?? DateTime.now().toString()),
      verified: json['verified'] ?? false,
    );
  }

  static void clear() {
    _instance = null;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    _instance = UserModel._(
      avatar: json['avatar'] ?? '',
      collectionId: json['collectionId'] ?? '',
      collectionName: json['collectionName'] ?? '',
      created: DateTime.parse(json['created']),
      email: json['email'] ?? '',
      emailVisibility: json['emailVisibility'] ?? false,
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      updated: DateTime.parse(json['updated']),
      verified: json['verified'] ?? false,
    );
    return _instance!;
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created.toIso8601String(),
      'email': email,
      'emailVisibility': emailVisibility,
      'id': id,
      'name': name,
      'updated': updated.toIso8601String(),
      'verified': verified,
    };
  }
}
