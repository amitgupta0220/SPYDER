class Validation {
  String validationForVignere(String text) {
    if (!(text.length > 2)) {
      return "Length of keyword should be greater than 2";
    }
    return "true";
  }

  String validationForAutoKey(String text, String key) {
    if (text.length != key.length) {
      return "Length of keyword and text should be equal";
    }
    return "true";
  }
}
