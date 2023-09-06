import 'package:starter/application/config/app_config.dart';
import 'package:starter/application/main/main.dart';

void main() {
  startApplication(const AppConfiguration(
      flavor: 'Prod',
      baseUrl: 'https://officeapi.dev/api',
      appName: 'Starter'));
}
