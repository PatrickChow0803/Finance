import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

// be sure to run flutter pub run build_runner build after copying this code
// also be sure to add this inside of main.dart: configureInjection(Environment.prod);
@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
