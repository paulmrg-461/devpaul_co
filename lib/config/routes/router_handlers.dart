import 'package:devpaul_co/presentation/providers/page_provider.dart';
import 'package:devpaul_co/presentation/screens/web/home_screen.dart';
import 'package:devpaul_co/presentation/screens/web/privacy_policy.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

final homeHandler = Handler(handlerFunc: (context, parameters) {
  final page = parameters['page']!.first;
  final PageProvider pageProvider =
      Provider.of<PageProvider>(context!, listen: false);
  if (page == 'privacy') {
    return const PrivacyPolicyScreen();
  }
  if (page != '/') {
    pageProvider.createScrollController(page);
    return const HomePage();
  }
});
final privacyPolicyHandler =
    Handler(handlerFunc: (context, parameters) => const PrivacyPolicyScreen());
