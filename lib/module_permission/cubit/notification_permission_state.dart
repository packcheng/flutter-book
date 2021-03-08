part of 'notification_permission_cubit.dart';

@immutable
abstract class NotificationPermissionState {}

/// [PermissionStatus.denied]
class NotificationPermissionDenied extends NotificationPermissionState {}

/// [PermissionStatus.granted]
class NotificationPermissionGranted extends NotificationPermissionState {}

/// [PermissionStatus.unknown]
class NotificationPermissionUnknown extends NotificationPermissionState {}

/// [PermissionStatus.provisional]
class NotificationPermissionProvisional extends NotificationPermissionState {}
