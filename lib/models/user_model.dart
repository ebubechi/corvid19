class User{
  final String id;
  final String fullname;
  final String address;
  final String username;
  final String sex;
  final String password;
  final String email;
  final String country;

  User({this.address,this.id, this.fullname, this.username, this.sex, this.password, this.email, this.country});
  User.fromData(Map<String,dynamic> data)
    :   id = data["id"],
        fullname = data["fullname"],
        username = data["username"],
        sex = data["sex"],
        password = data["password"],
        email = data["email"],
        country = data["country"],
        address = data["address"];

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'fullname':fullname,
      'username': username,
      'email':email,
      'sex': sex,
      'password':password,
      'country':country,
      'address': address
    };
  }
}