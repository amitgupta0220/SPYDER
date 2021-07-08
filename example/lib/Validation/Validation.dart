class Validation {
  String validationForHillCipher(String text) {
    List<String> listOfArg = text.split(" ");
    if (listOfArg.length != 4) {
      return "There should be exactly 4 intergers separated by space";
    }
    return "true";
  }

  String validationForVignere(String text) {
    if (!(text.length > 2)) {
      return "Length of keyword should be greater than 2";
    }
    return "true";
  }

  String validationForPlayFair(String text) {
    if (!(text.length < 25)) {
      return "Length of keyword should be 25 only";
    }
    return "true";
  }
}
