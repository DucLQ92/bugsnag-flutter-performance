import 'dart:convert';

import 'package:bugsnag_flutter_performance/bugsnag_flutter_performance.dart';
import 'package:mazerunner/main.dart';

import 'scenario.dart';
import 'package:http/http.dart' as http;

class InitialPScenario extends Scenario {
  @override
  Future<void> run() async {
    BugsnagPerformance.setExtraConfig("instrumentAppStart", false);
    BugsnagPerformance.setExtraConfig("instrumentNavigation", false);
    BugsnagPerformance.setExtraConfig("probabilityRequestsPause", 1000);
    BugsnagPerformance.setExtraConfig("probabilityValueExpireTime", 25000);
    BugsnagPerformance.start(
        apiKey: '12312312312312312312312312312312',
        endpoint: Uri.parse(FixtureConfig.MAZE_HOST.toString() + '/traces'));
    setMaxBatchSize(1);
    doSimpleSpan('First');
  }

  void step2() {
    doSimpleSpan('Second');
  }

  @override
  void invokeMethod(String name) {
    switch (name) {
      case 'step2':
        step2();
        break;
      default:
        break;
    }
  }
}
