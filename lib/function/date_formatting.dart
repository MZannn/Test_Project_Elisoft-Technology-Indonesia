import 'package:intl/intl.dart';

String formatDate(String inputDateTime) {
  final inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss.SSSSSS', 'id');
  final outputFormat = DateFormat('dd MMMM yyyy, HH:mm:ss', 'id');

  final dateTime = inputFormat.parse(inputDateTime);
  final dateString = outputFormat.format(dateTime);
  return dateString;
}
