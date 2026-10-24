import 'package:url_launcher/url_launcher.dart';
import 'package:vocly/app/core/error/vocly_error.dart';

class LuncherService {
  void lunchPreparedBooksWebPage() async {
    final Uri url = Uri.parse('https://soft98.ir');
    if (!await launchUrl(url)) {
      throw const AppError(errorMessage: 'Cant open web page!');
    }
  }
}
