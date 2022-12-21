import 'dart:convert';

class Users {
  Users({
    this.name,
    this.email,
    this.password,
    this.imageUrl,
    this.points = 700,
    this.DOB,
    this.Gender,
  });

  String? name;
  String? email;
  String? password;
  String? imageUrl;
  int points;
  String? DOB;
  String? Gender;

  int get division {
    if (points < 1200) return 3;
    if (points < 2000) return 2;
    return 1;
  }

  String get profilePicture =>
      imageUrl ??
      'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-512.png';

  bool get isEmailSignin => password != null;

  bool get isGoogleSignin => password == null && email != null;

  bool get isAuth => name != null;

  String? get username => email?.split('@')[0];

  void addPoints(int addedPoints) {
    points += addedPoints;
  }

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
    int? points,
    String? DOB,
    String? Gender,
  }) {
    return Users(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        imageUrl: imageUrl ?? this.imageUrl,
        points: points ?? this.points,
        DOB: DOB ?? this.DOB,
        Gender: Gender ?? this.Gender);
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
    if (DOB != null) {
      result.addAll({'DOB': DOB});
    }
    if (Gender != null) {
      result.addAll({'Gender': Gender});
    }
    result.addAll({'points': points});

    return result;
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      imageUrl: map['imageUrl'],
      points: map['points']?.toInt() ?? 0,
      DOB: map['DOB'],
      Gender: map['Gender'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Users(name: $name, email: $email, password: $password, imageUrl: $imageUrl, points: $points, DOB: $DOB, Gender: $Gender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Users &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.imageUrl == imageUrl &&
        other.points == points &&
        other.DOB == DOB &&
        other.Gender == Gender;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        imageUrl.hashCode ^
        points.hashCode ^
        DOB.hashCode ^
        Gender.hashCode;
  }
}
