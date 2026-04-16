import 'package:my_quran/common/flavor_config.dart';
import 'package:my_quran/myapp.dart';

Future<void> main() async {
  await bootstrap(FlavorConfig.staging);
}
