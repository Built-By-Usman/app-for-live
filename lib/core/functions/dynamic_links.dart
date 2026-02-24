import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_auth/firebase_auth.dart';

void initDynamicLinks() async {
  FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) async {
    final Uri deepLink = dynamicLinkData.link;
    print("Deep link received: $deepLink");

    // Only if it’s a Firebase phone auth callback
    if (deepLink.queryParameters.containsKey('authType')) {
      await FirebaseAuth.instance.applyActionCode(deepLink.queryParameters['oobCode'] ?? '');
    }
  }).onError((error) {
    print("Dynamic link error: $error");
  });

  // Handle app launched via a link
  final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
  if (initialLink != null) {
    final Uri deepLink = initialLink.link;
    print("Initial deep link: $deepLink");
    // Handle same as above
  }
}