
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ubi_crm/core/routes/route_constant.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/login_signup_binding.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/login_signup_page.dart';
import 'package:ubi_crm/features/auth/login_sign_up/presentation/widget/continue_with_email.dart';
import 'package:ubi_crm/features/auth/sign_up_module/binding/sign_up_binding.dart';
import 'package:ubi_crm/features/auth/sign_up_module/view/sign_up_view.dart';
import 'package:ubi_crm/features/dashboard/binding/dashboard_binding.dart';
import 'package:ubi_crm/features/dashboard/view/dashboard.dart';
import 'package:ubi_crm/features/language_selection/binding/languageselection_binding.dart';
import 'package:ubi_crm/features/language_selection/view/languageselection_page.dart';
import 'package:ubi_crm/features/lead_module/lead/presentation/binding/lead_binding.dart';
import 'package:ubi_crm/features/lead_module/lead/presentation/view/lead_view.dart';
import 'package:ubi_crm/features/lead_module/lead_profile/presentation/binding/lead_profile_binding.dart';
import 'package:ubi_crm/features/lead_module/lead_profile/presentation/view/lead_profile_view.dart';
import 'package:ubi_crm/features/sales_team/presentation/binding/sales_team_binding.dart';
import 'package:ubi_crm/features/sales_team/presentation/view/sales_team_view.dart';
import 'package:ubi_crm/features/setting_module/settings/binding/settings_binding.dart';
import 'package:ubi_crm/features/setting_module/settings/view/settings_page.dart';
import 'package:ubi_crm/features/splash_screen/binding/splash_binding.dart';
import 'package:ubi_crm/features/splash_screen/view/splash_page.dart';

List<GetPage> getPages = [
  GetPage(
      name: RouteConstant.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding()),
  GetPage(
      name: RouteConstant.languageSelectionPage,
      page: () => const LanguageSelectionPage(),
      binding: LanguageSelectionBinding()),
  GetPage(
      name: RouteConstant.login,
      page: () => LoginSignupPage(),
      binding: LoginSignupBinding()),
  GetPage(
      name: RouteConstant.loginWithEmail,
      page: () =>  ContinueWithEmail(),
      binding: LoginSignupBinding()),
  GetPage(
      name: RouteConstant.dashboard,
      page: () => Dashboard(),
      binding: DashboardBinding()),

  GetPage(
      name: RouteConstant.leadView,
      page: () => LeadView(),
      binding: LeadBinding()),

  GetPage(
      name: RouteConstant.leadProfile,
      page: () => LeadProfileView(),
      binding: LeadProfileBinding()),

  GetPage(
      name: RouteConstant.salesTeamView,
      page: () => SalesTeamView(),
      binding: SalesTeamBinding()),
  // GetPage(
  //     name: RouteConstant.onBoardingPage,
  //     page: () => const OnBoardingPage(),
  //     binding: OnBoardingBinding()),
  // GetPage(
  //     name: RouteConstant.forgotPassword,
  //     page: () => ForgotPasswordPage(),
  //     binding: ForgotPasswordBinding()),
  GetPage(
      name: RouteConstant.signupPage,
      page: () => SignupViewPage(),
      binding: SignupBinding()),

  GetPage(
      name: RouteConstant.settingPage,
      page: () => SettingsPage(),
      binding: SettingsBinding()),

  // GetPage(
  //     name: RouteConstant.logs, page: () => LogsView(), binding: LogsBinding()),
  // GetPage(poa
  //     name: RouteConstant.home, page: () => const HomePage(), binding: HomeBinding()),
  // GetPage(
  //     name: RouteConstant.addonsScreen,
  //     page: () => AddonsPage()),
  // GetPage(
  //     name: RouteConstant.myAddonsScreen,
  //     page: () => const MyAddonsPage(),
  //     binding: MyAddonsBinding()),
  // GetPage(
  //     name: RouteConstant.suggestedAddonsScreen,
  //     page: () => SuggestedAddonsPage(),
  //     binding: SuggestedAddonsBinding()),
  //
];
