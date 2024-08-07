import 'package:jnee/controllers/auth_controller.dart';
import 'package:jnee/controllers/hearing_controller.dart';
import 'package:jnee/controllers/home_controller.dart';
import 'package:jnee/controllers/organization_controller.dart';
import 'package:jnee/controllers/parliament_controller.dart';
import 'package:jnee/controllers/search_controller.dart';
import 'package:jnee/controllers/splash_controller.dart';

import 'package:jnee/screens/detail/detail_screen.dart';
import 'package:jnee/screens/hearing/public_hearing.dart';
import 'package:jnee/screens/home/home_screen.dart';
import 'package:jnee/screens/home/search_form.dart';
import 'package:jnee/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:jnee/screens/organization/organization_filter_screen.dart';
import 'package:jnee/screens/parliament/andean_parliament.dart';
import 'package:jnee/screens/splash/splash_screen.dart';

class AppRoutes {
  static const String splashPage = "/splash";
  static const String homePage = "/";
  static const String loginPage = "/login";

  static const String cardDetailPage = "/card-detail";
  static const String organizationFilterPage = "/organization-filter";
  static const String publicHearingPage = "/public-hearing";
  static const String andeanParliamentPage = "/andean-parliament";

  static const String searchPage = "/search";

  static List<GetPage> routes() => [
        GetPage(
          name: splashPage,
          page: () => const SplashScreen(),
          binding: BindingsBuilder(() {
            Get.put(SplashController());
          }),
        ),
        GetPage(
          name: homePage,
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            //Get.put(AuthController());
            Get.put(HomeController());
            //Get.put(MyZoomDrawerController());
          }),
        ),
        // GetPage(
        //   name: loginPage,
        //   page: () => const LoginScreen(),
        //   binding: BindingsBuilder(() {
        //     Get.put(AuthController());
        //     Get.put(MyZoomDrawerController());
        //   }),
        // ),
        GetPage(
          name: cardDetailPage,
          page: () => const DetailScreen(),
          binding: BindingsBuilder(() {
            //Get.put(SplashController());
          }),
        ),
        GetPage(
          name: organizationFilterPage,
          page: () => const OrganizationFilterScreen(),
          binding: BindingsBuilder(() {
            Get.put(OrganizationController());
          }),
        ),
        GetPage(
          name: publicHearingPage,
          page: () => const PublicHearingScreen(),
          binding: BindingsBuilder(() {
            Get.put(HearingController());
          }),
        ),
        GetPage(
          name: andeanParliamentPage,
          page: () => const AndeanParliamentScreen(),
          binding: BindingsBuilder(() {
            Get.put(ParliamentController());
          }),
        ),
        // GetPage(
        //   name: searchPage,
        //   page: () => const SearchForm(),
        //   binding: BindingsBuilder(() {
        //     Get.put(SearchController());
        //   }),
        // ),
      ];
}
