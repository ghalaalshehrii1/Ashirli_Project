class SessionModel {
  final String id;
  final String title;
  final String date;
  final String time;
  final String doctorName;
  final String doctorSpecialty;
  final String status;
  final String result;
  final String note;
  final String conversation;

  const SessionModel({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.status,
    required this.result,
    required this.note,
    required this.conversation,
  });
}