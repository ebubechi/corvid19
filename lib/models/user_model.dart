class User{
  final String id;
  final String firstname;
  final String lastname;
  final String username;
  final String sex;
  final String password;
  final String email;
  final String country;
  // final String countrycode;

  User({this.lastname, this.id, this.firstname, this.username, this.sex, this.password, this.email, this.country});
  User.fromData(Map<String,dynamic> data)
    :   id = data["id"],
        firstname = data["firstname"],
        lastname = data["lastname"],
        username = data["username"],
        sex = data["sex"],
        password = data["password"],
        // countrycode = data["countrycode"],
        email = data["email"],
        country = data["country"];

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'firstname':firstname,
      'lastname':lastname,
      'username': username,
      'email':email,
      'sex': sex,
      'password':password,
      // 'countrycode':countrycode,
      'country':country
    };
  }
}