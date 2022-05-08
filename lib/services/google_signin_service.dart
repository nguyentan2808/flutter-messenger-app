import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final GoogleSignIn googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() async {
    GoogleSignInAccount? user = await googleSignIn.signIn();

    // final auth = await user?.authentication;
    // final tokenId = auth?.idToken;
    return user;
  }

  // static void printWrapped(String text) {
  //   final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  //   pattern.allMatches(text).forEach((match) => print(match.group(0)));
  // }
}
