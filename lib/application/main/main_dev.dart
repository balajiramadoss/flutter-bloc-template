import 'package:starter/application/config/app_config.dart';
import 'package:starter/application/main/main.dart';

void main() {
  startApplication(const AppConfiguration(
      flavor: 'Dev',
      baseUrl: 'https://api.gameofthronesquotes.xyz/v1',
      appName: 'Starter Dev'));
}
