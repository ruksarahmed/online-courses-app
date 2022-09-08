import 'package:company_profile/model/company.dart';

class RepoData {
  static final Company bawr = Company(
    name: "Build Apps with Ruksar",
    location: "Hyderabad, India.",
    logo: "assets/ra-site-icon.png",
    backDropPhoto: "assets/ruksar_pic.jpg",
    about: "I am a Designer, Developer & Data Scientist.",
    cources: <Cource>[
      Cource(
        title: "The Complete Flutter & Dart Bootcamp.",
        thumbnail: "assets/flutter_cource.png",
        url: "https://ruksar.in",
      ),
      Cource(
        title: "The Complete Flutter & Dart Bootcamp.",
        thumbnail: "assets/flutter_cource.png",
        url: "https://ruksar.in",
      ),
      Cource(
        title: "The Complete Flutter & Dart Bootcamp.",
        thumbnail: "assets/flutter_cource.png",
        url: "https://ruksar.in",
      ),
    ],
  );
}
