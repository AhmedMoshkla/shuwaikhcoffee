// File: app_regex.dart
class AppRegex {
  static String removeHtmlTags(String text) => text.replaceAll(RegExp(r'<[^>]*>'), '');
}
