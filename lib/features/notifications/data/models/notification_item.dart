/// UI model for a single notification in the list.
enum NotificationCardType {
  bloodRequest,
  donorAccepted,
  thankYou,
  requestCompleted,
  importantAlert,
}

class NotificationItem {
  final String id;
  final NotificationCardType type;
  final String title;
  final String body;
  final String? subtitle;
  final String timeAgo;
  final bool isRead;
  final DateTime receivedAt;

  const NotificationItem({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    this.subtitle,
    required this.timeAgo,
    this.isRead = false,
    required this.receivedAt,
  });
}

final List<NotificationItem> testNotifications = [
  NotificationItem(
    id: '1',
    type: NotificationCardType.bloodRequest,
    title: 'طلب تبرع جديد',
    body: 'يوجد مريض يحتاج إلى فصيلة +A بشكل عاجل في مستشفى الشفاء.',
    subtitle: 'المسافة: 3 كم',
    timeAgo: 'منذ 5 دقائق',
    isRead: false,
    receivedAt: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  NotificationItem(
    id: '2',
    type: NotificationCardType.donorAccepted,
    title: 'تم قبول متبرع',
    body: 'قام أحمد محمد بقبول طلب التبرع الخاص بك.',
    subtitle: 'فصيلة الدم: O-',
    timeAgo: 'منذ 15 دقيقة',
    isRead: true,
    receivedAt: DateTime.now().subtract(const Duration(minutes: 15)),
  ),
  NotificationItem(
    id: '3',
    type: NotificationCardType.thankYou,
    title: 'شكراً لمساهمتك ❤️',
    body: 'نشكر لك تبرعك اليوم، لقد ساعدت في إنقاذ حياة إنسان.',
    subtitle: null,
    timeAgo: 'منذ ساعة',
    isRead: false,
    receivedAt: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  NotificationItem(
    id: '4',
    type: NotificationCardType.importantAlert,
    title: 'تنبيه هام',
    body: 'يرجى تحديث بياناتك الشخصية لضمان استمرار استلام الطلبات.',
    subtitle: 'الإجراء مطلوب',
    timeAgo: 'منذ ساعتين',
    isRead: true,
    receivedAt: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  NotificationItem(
    id: '5',
    type: NotificationCardType.requestCompleted,
    title: 'تم إكمال الطلب',
    body: 'تم إكمال طلب التبرع بنجاح، شكراً لمشاركتك.',
    subtitle: 'مستشفى الجامعة',
    timeAgo: 'منذ يوم',
    isRead: false,
    receivedAt: DateTime.now().subtract(const Duration(days: 1)),
  ),
];
