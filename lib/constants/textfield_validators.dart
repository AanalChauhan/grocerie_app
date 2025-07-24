class TextfieldValidators {
  static String? nameValidator(String name){
    if(name.isEmpty) return "Name is required";
    return null;
  }
  static String? emailValidator(String email){
    if(!email.contains("@")||!email.contains("."))return "Invalid email";
    return null;
  }
  static String? passwordValidator(String Password){
    if(Password.length < 8)return "Password is not valid it should contain atleast 8 characters";
    return null;
  }
}