import 'package:profilepage4/profile.dart';


class ProfileProvider {
  static Profile getProfile() {
    return Profile(
        user: User(
            name: 'Eslam Fares',
            job: 'Software Engineer',
            about:
                "Lorem ipsum dolor sit amet test pop, consectetur adipiscing elit."),
        following: 364,
        followers: 2318,
        friends: 175);
  }
}
