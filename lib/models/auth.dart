class Signup {
  String phone;
  String password;
  String passwordRepeat;
  String verificationCode;

  Signup(this.phone, this.password, this.passwordRepeat, this.verificationCode);

  factory Signup.empty() {
    return Signup("", "", "", "");
  }
}
