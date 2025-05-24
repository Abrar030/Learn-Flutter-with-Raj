import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/register_screen.dart';
import '/features/auth/screens/home_screen.dart';
import 'sos/screens/sos_screen.dart';
import 'sos/screens/emergency_history_screen.dart';
import 'trusted_contacts/screens/view_contacts_screen.dart';
import 'trusted_contacts/screens/add_contact_screen.dart';
import 'trusted_contacts/screens/edit_contact_screen.dart';
import 'community/screens/community_screen.dart';
import 'community/screens/community_detail_screen.dart';
import 'news/screens/news_screen.dart';
import 'settings/screens/settings_screen.dart';
import 'settings/screens/passkey_setup_screen.dart';
import 'settings/screens/about_screen.dart';
import 'features/auth/screens/onboarding_screen.dart';
import 'features/auth/screens/permissions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.sos: (context) => const SOSScreen(),
        AppRoutes.emergencyHistory: (context) => const EmergencyHistoryScreen(),
        AppRoutes.contacts: (context) => const TrustedContactsScreen(),
        AppRoutes.addContact: (context) => const AddTrustedContactScreen(),
        AppRoutes.editContact: (context) => const EditTrustedContactScreen(),
        AppRoutes.community: (context) => const CommunityScreen(),
        AppRoutes.communityDetail: (context) => const CommunityDetailScreen(),
        AppRoutes.news: (context) => const NewsScreen(),
        AppRoutes.settings: (context) => const SettingsScreen(),
        AppRoutes.passkey: (context) => const PasskeySetupScreen(),
        AppRoutes.about: (context) => const AboutScreen(),
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.permissions: (context) => const PermissionsScreen(),
      },
    );
  }
}

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String sos = '/sos';
  static const String emergencyHistory = '/emergency-history';
  static const String contacts = '/contacts';
  static const String addContact = '/add-contact';
  static const String editContact = '/edit-contact';
  static const String community = '/community';
  static const String communityDetail = '/community-detail';
  static const String news = '/news';
  static const String settings = '/settings';
  static const String passkey = '/passkey';
  static const String about = '/about';
  static const String onboarding = '/onboarding';
  static const String permissions = '/permissions';
}
