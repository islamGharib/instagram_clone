
class UserModel{
  final String uId ;
  final String name;
  final String email;
  final String phone;
  final String profileImageUrl;
  // final dynamic cover;
  final String bio;
  final dynamic followers;
  final dynamic following;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
    required this.phone,
    required this.bio,
    required this.profileImageUrl,
    // this.cover,
    this.followers,
    this.following,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : uId = json['uId'],
        name = json['name'],
        email = json['email'],
        phone = json['phone'],
        profileImageUrl = json['image'],
        // cover = json['cover'],
        followers = json['followers'],
        following = json['following'],
        bio = json['bio'];

  Map <String, dynamic> toMap(){
    return {
      'uId':uId,
      'name':name,
      'email':email,
      'phone':phone,
      'image':profileImageUrl,
      // 'cover':cover,
      'bio':bio,
      'followers':[],
      'following':[]
    };
  }
}
