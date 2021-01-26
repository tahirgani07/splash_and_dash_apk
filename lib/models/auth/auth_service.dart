import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  String verificationId;
  String email;
  String password;

  AuthService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  void setEmailAndPassword(String email, String password) {
    this.email = email;
    this.password = password;
  }

  void setVerificationId(String verificationId) =>
      this.verificationId = verificationId;

  Future<String> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed In Successfully!";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<bool> checkOtpAndSignUpWithPhone(String smsCode) async {
    try {
      /// First Authentication the phone number with otp.
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: this.verificationId, smsCode: smsCode);
      await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<String> linkEmailWithPhone() async {
    try {
      /// Signing in the user with Email & Password After otp verifiaction.
      EmailAuthCredential emailAuthCredential = EmailAuthProvider.credential(
          email: this.email, password: this.password);
      await _firebaseAuth.currentUser.linkWithCredential(emailAuthCredential);
      return "Signed Up Successfully!";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return "Signed Out";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
