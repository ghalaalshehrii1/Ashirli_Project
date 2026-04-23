/// Dummy session row for History / Session Details (UI only).
class SessionRecord {
  const SessionRecord({
    required this.dateLabel,
    required this.patientName,
    required this.result,
    required this.prediction,
    required this.confidence,
  });

  final String dateLabel;
  final String patientName;
  /// Short line shown in the history list.
  final String result;
  /// Full prediction text on the details screen.
  final String prediction;
  final String confidence;
}
