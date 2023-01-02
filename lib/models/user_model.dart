import 'dart:convert';

class Users {
  Users({
    this.name,
    this.email,
    this.password,
    this.imageUrl,
    this.userID,
    this.DOB,
    this.Gender,
  });

  String? name;
  String? email;
  String? password;
  String? imageUrl;
  String? userID;
  String? DOB;
  String? Gender;

  String get profilePicture =>
      imageUrl ??
      'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-512.png';

  bool get isEmailSignin => password != null;

  bool get isGoogleSignin => password == null && email != null;

  bool get isAuth => name != null;

  String? get username => email?.split('@')[0];

  void clearUser() {
    name = null;
    email = null;
    imageUrl = null;
  }

  Users copyWith({
    String? name,
    String? email,
    String? password,
    String? imageUrl,
    String? userID,
    String? DOB,
    String? Gender,
  }) {
    return Users(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      imageUrl: imageUrl ?? this.imageUrl,
      userID: userID ?? this.userID,
      DOB: DOB ?? this.DOB,
      Gender: Gender ?? this.Gender,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (password != null) {
      result.addAll({'password': password});
    }
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }
    if (userID != null) {
      result.addAll({'userID': userID});
    }
    if (DOB != null) {
      result.addAll({'DOB': DOB});
    }
    if (Gender != null) {
      result.addAll({'Gender': Gender});
    }

    return result;
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      imageUrl: map['imageUrl'],
      userID: map['userID'],
      // DOB: map['DOB'],
      // Gender: map['Gender'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Users(name: $name, email: $email, password: $password, imageUrl: $imageUrl, userID: $userID  DOB: $DOB, Gender: $Gender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Users &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.imageUrl == imageUrl &&
        other.userID == userID &&
        other.DOB == DOB &&
        other.Gender == Gender;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        imageUrl.hashCode ^
        userID.hashCode ^
        DOB.hashCode ^
        Gender.hashCode;
  }
}
