class User{
  String name,job,about;

  User({this.name, this.job, this.about});

}
class Profile{
  User user;
  int followers,following,friends;

  Profile({this.user, this.followers, this.following, this.friends});

}