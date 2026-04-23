import '../models/doctor_model.dart';
import '../models/session_model.dart';

class DummyData {
  static const DoctorModel mainDoctor = DoctorModel(
    name: 'د. ناصر القحطاني',
    specialty: 'أخصائي أمراض الرئة',
    phone: '0538376489',
  );

  static const List<SessionModel> sessions = [
    SessionModel(
      id: '1',
      title: 'الجلسة رقم 1',
      date: '28 أكتوبر 2025',
      time: '2:35 م',
      doctorName: 'د. ناصر القحطاني',
      doctorSpecialty: 'أخصائي أمراض الرئة',
      status: 'مكتملة',
      result: 'تم التعرف على الإشارة: أعاني من الربو',
      note: 'المريض يعاني من ضيق بسيط في التنفس وألم خفيف في منطقة الصدر',
      conversation: '2:35 - الطبيب: هل تشعر بتحسن اليوم؟\n'
          '2:36 - المريض: ليس كثيرًا، ما زال صدري يشعر بالثقل\n'
          '2:37 - الطبيب: فهمت، سأرسل لك التعليمات الآن',
    ),
    SessionModel(
      id: '2',
      title: 'الجلسة رقم 2',
      date: '8 أغسطس 2025',
      time: '1:45 م',
      doctorName: 'د. سارة الفهد',
      doctorSpecialty: 'أخصائية الأعصاب',
      status: 'مكتملة',
      result: 'تم التعرف على الإشارة: أشعر بتنميل في اليد',
      note: 'تمت مراجعة الأعراض ويوصى بالمتابعة إذا استمر التنميل',
      conversation: '1:45 - الطبيب: متى بدأ التنميل؟\n'
          '1:46 - المريض: منذ يومين\n'
          '1:47 - الطبيب: سنراقب الحالة ونحدد الخطة المناسبة',
    ),
    SessionModel(
      id: '3',
      title: 'الجلسة رقم 3',
      date: '2 أغسطس 2025',
      time: '12:30 م',
      doctorName: 'د. خالد المطيري',
      doctorSpecialty: 'أخصائي الأنف والأذن والحنجرة',
      status: 'مكتملة',
      result: 'تم التعرف على الإشارة: أعاني من ألم في الحلق',
      note: 'يوصى بالإكثار من السوائل الدافئة والراحة',
      conversation: '12:30 - الطبيب: هل لديك حرارة؟\n'
          '12:31 - المريض: لا\n'
          '12:32 - الطبيب: جيد، سنتابع بالأدوية والتعليمات',
    ),
  ];
}