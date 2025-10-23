import 'package:bloomix/app/app.dart';
import 'package:bloomix/bootstrap_enhanced.dart';

void main() {
  bootstrap(() => const App(), environment: 'production');
}
