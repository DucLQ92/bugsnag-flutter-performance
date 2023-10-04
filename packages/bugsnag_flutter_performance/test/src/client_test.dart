import 'package:bugsnag_flutter_performance/src/client.dart';
import 'package:bugsnag_flutter_performance/src/extensions/date_time.dart';
import 'package:bugsnag_flutter_performance/src/span.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const apiKey = 'TestApiKey';
  final endpoint = Uri.tryParse('https://bugsnag.com')!;
  group('BugsnagPerformanceClient', () {
    late BugsnagPerformanceClient client;

    setUp(() {
      client = BugsnagPerformanceClient();
    });
    group('start', () {
      test('should set configuration with the provided parameters', () {
        client.start(apiKey: apiKey, endpoint: endpoint);

        expect(client.configuration!.apiKey, equals(apiKey));
        expect(client.configuration!.endpoint, equals(endpoint));
      });
    });

    group('startSpan', () {
      const name = 'TestSpanName';
      test(
          'should return a running span with the provided name and current time',
          () {
        final timeBeforeStart = DateTime.now();
        final span = client.startSpan(name) as BugsnagPerformanceSpanImpl;
        final timeAfterStart = DateTime.now();

        expect(span.name, equals(name));
        expect(
            span.startTime.nanosecondsSinceEpoch >=
                timeBeforeStart.nanosecondsSinceEpoch,
            isTrue);
        expect(
            span.startTime.nanosecondsSinceEpoch <=
                timeAfterStart.nanosecondsSinceEpoch,
            isTrue);
        expect(span.endTime, isNull);
      });
    });
  });
}
