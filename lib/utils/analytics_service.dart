import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';

@singleton
class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnaliticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  // getter
  FirebaseAnalytics get analytics => _analytics;
}
