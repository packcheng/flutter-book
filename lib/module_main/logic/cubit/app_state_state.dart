part of 'app_state_cubit.dart';

@immutable
abstract class AppState {}

/// [AppLifecycleState.inactive]
class AppStateInactive extends AppState {}

/// [AppLifecycleState.paused]
class AppStatePaused extends AppState {}

/// [AppLifecycleState.resumed]
class AppStateResumed extends AppState {}

/// [AppLifecycleState.detached]
class AppStateDetached extends AppState {}
