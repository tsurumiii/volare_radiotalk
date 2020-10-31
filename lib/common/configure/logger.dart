import 'package:simple_logger/simple_logger.dart';

SimpleLogger _logger;
SimpleLogger get logger => _logger;

void loggerConfigure() {
  _logger = SimpleLogger()
    ..setLevel(Level.FINE, includeCallerInfo: true,);
}
