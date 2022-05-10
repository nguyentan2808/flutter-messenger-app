import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final GoogleSignIn googleSignIn = GoogleSignIn();

  static Future<String?> getTokenId() async {
    try {
      GoogleSignInAccount? user = await googleSignIn.signIn();

      if (user == null) return null;

      final auth = await user.authentication;
      final tokenId = auth.idToken;

      return tokenId;
    } catch (e) {
      throw Exception("Google sign in error");
    }
  }

  Future signOut() async {
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.disconnect();
    }
  }

  // static void printWrapped(String text) {
  //   final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  //   pattern.allMatches(text).forEach((match) => print(match.group(0)));
  // }
}
