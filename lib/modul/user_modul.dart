class User{
  String? id;
  String? email;
  String? password;
  User({this.id,this.password,this.email});
  User.from({this.email,this.password});


  User.fromJson(Map,json)
  : id = json['id'],
  email = json['email'],
  password = json['password'];

  Map toJson() => {
    'id' : id,
    'email' : email,
    'password' : password
  };

}