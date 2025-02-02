import 'package:bugsnag_flutter_performance/bugsnag_flutter_performance.dart';
import 'scenario.dart';

class CustomServiceNameScenario extends Scenario {
  @override
  Future<void> run() async {
    await startBugsnag(serviceName: "com.custom.serviceName");
    setMaxBatchSize(1);
    doSimpleSpan('CustomServiceNameScenario');
  }
}
