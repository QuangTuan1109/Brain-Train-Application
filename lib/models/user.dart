class User {
  final int id;
  final String dob;
  final String name;
  final String sdt;
  final String email;
  final String urlImage;
  final String score_Languages1;
  final String list_Languages1;
  final String score_Languages2;
  final String list_Languages2;
  final String score_Languages3;
  final String list_Languages3;
  final String level_Languages4;
//
  final String score_Memory1;
  final String level_Memory1;
  final String score_Memory2;
  final String level_Memory2;
  final String score_Memory3;
  final String level_Memory3;
  //
  final String score_Math1;
  final String level_Math1;
  final String score_Math2;
  final String level_Math2;
  //
  final String score_Attention1;
  final String level_Attention1;
  final String score_Attention2;
  final String level_Attention2;
  final String score_Attention3;
  final String level_Attention3;
  // final String list_Languages4;
  const User({
    required this.id,
    required this.name,
    required this.dob,
    required this.sdt,
    required this.email,
    required this.urlImage,
    required this.score_Languages1,
    required this.list_Languages1,
    required this.score_Languages2,
    required this.list_Languages2,
    required this.score_Languages3,
    required this.list_Languages3,
    required this.level_Languages4,
    //
    required this.score_Memory1,
    required this.level_Memory1,
    required this.score_Memory2,
    required this.level_Memory2,
    required this.score_Memory3,
    required this.level_Memory3,
    //
    required this.score_Math1,
    required this.level_Math1,
    required this.score_Math2,
    required this.level_Math2,
    //
    required this.score_Attention1,
    required this.level_Attention1,
    required this.score_Attention2,
    required this.level_Attention2,
    required this.score_Attention3,
    required this.level_Attention3,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        dob: json['dob'],
        sdt: json['sdt'],
        email: json['email'],
        score_Languages1: json['Score_Languages1'],
        urlImage: json['urlImage'],
        list_Languages1: json['List_Languages1'],
        score_Languages2: json['Score_Languages2'],
        list_Languages2: json['List_Languages2'],
        score_Languages3: json['Score_Languages3'],
        list_Languages3: json['List_Languages3'],
        level_Languages4: json['level_Languages4'],
        //
        score_Memory1: json['score_Memory1'],
        level_Memory1: json['level_Memory1'],
        score_Memory2: json['score_Memory2'],
        level_Memory2: json['level_Memory2'],
        score_Memory3: json['score_Memory3'],
        level_Memory3: json['level_Memory3'],
        //
        score_Math1: json['score_Math1'],
        level_Math1: json['level_Math1'],
        score_Math2: json['score_Math2'],
        level_Math2: json['level_Math2'],
        //
        score_Attention1: json['score_Attention1'],
        level_Attention1: json['level_Attention1'],
        score_Attention2: json['score_Attention2'],
        level_Attention2: json['level_Attention2'],
        score_Attention3: json['score_Attention3'],
        level_Attention3: json['level_Attention3'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'dob': dob,
        'name': name,
        'sdt': sdt,
        'email': email,
        'urlImage': urlImage,
        'score_Languages1': score_Languages1,
        'list_Languages1': list_Languages1,
        'score_Languages2': score_Languages2,
        'list_Languages2': list_Languages2,
        'score_Languages3': score_Languages3,
        'list_Languages3': list_Languages3,
        'level_Languages4': level_Languages4,
        //
        'score_Memory1': score_Memory1,
        'level_Memory1': level_Memory1,
        'score_Memory2': score_Memory2,
        'level_Memory2': level_Memory2,
        'score_Memory3': score_Memory3,
        'level_Memory3': level_Memory3,
        //
        'score_Math1': score_Math1,
        'level_Math1': level_Math1,
        'score_Math1': score_Math2,
        'level_Math1': level_Math2,
        //
        'score_Attention1': score_Attention1,
        'level_Attention1': level_Attention1,
        'score_Attention2': score_Attention2,
        'level_Attention2': level_Attention2,
        'score_Attention3': score_Attention3,
        'level_Attention3': level_Attention3,
      };
}
