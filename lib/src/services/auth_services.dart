import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:_happytone/src/features/authentication/screens/dashboard/dashboard.dart';

class AuthService {
  // Google SignIn
  signInWithGoogle() async {
    // Begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // Obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // creating a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    // finally, lets sign in
    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() => Get.offAll(() => const Dashboard()));
  }
}
