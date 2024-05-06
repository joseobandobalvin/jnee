import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/controllers/home_controller.dart';
import 'package:jnee/generated/l10n.dart';
import 'package:jnee/models/cv.dart';
import 'package:jnee/models/user.dart';

import 'package:jnee/screens/detail/page1.dart';
import 'package:jnee/screens/detail/widgets/detail_academic_formationx.dart';
import 'package:jnee/screens/detail/widgets/detail_aditional_informationx.dart';
import 'package:jnee/screens/detail/widgets/detail_basic_informationx.dart';
import 'package:jnee/screens/detail/widgets/detail_sentencex.dart';
import 'package:jnee/screens/detail/widgets/detail_sworn_declarationx.dart';
import 'package:jnee/screens/detail/widgets/detail_trajectoryx.dart';
import 'package:jnee/screens/detail/widgets/detail_work_experiencex.dart';
import 'package:jnee/widgets/global_widgets/shimmer.dart';

// class DetailScreenEx extends StatefulWidget {
//   const DetailScreenEx({super.key});

//   @override
//   State<DetailScreenEx> createState() => _DetailScreenExState();
// }

// class _DetailScreenExState extends State<DetailScreenEx> {
//   final Cv cv = Get.arguments;
//   late Future<User> res;
//   final HomeController _homeController = HomeController();

//   @override
//   void initState() {
//     res = _homeController.getUserInformation(cv.idHojaVida.toInt());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var idHojaVida = cv.idHojaVida.toInt();
//     var idOrgPol = cv.idOrganizacionPolitica.toInt();

//     return Scaffold(
//       body: DefaultTabController(
//         length: 5,
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               backgroundColor: kDarkBlue,
//               title: Text(cv.nombreCompleto),
//               expandedHeight: 60.0,
//               elevation: 10.0,
//               pinned: true,
//             ),
//             SliverToBoxAdapter(
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(10),
//                     width: double.maxFinite,
//                     child: Text(
//                       textAlign: TextAlign.center,
//                       cv.organizacionPolitica,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(bottom: 4.0),
//                     height: 130,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Image.network(
//                             "${S.current.urlPhotoResume}/$idHojaVida.jpg",
//                           ),
//                         ),
//                         Expanded(
//                           child: Image.network(
//                             "${S.current.urlPoliticalGroupSymbol}/$idOrgPol",
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SliverAppBar(
//               pinned: true,
//               automaticallyImplyLeading: false,
//               primary: false,
//               elevation: 8.0,
//               backgroundColor: Colors.deepPurple,
//               title: Align(
//                 alignment: AlignmentDirectional.center,
//                 child: TabBar(
//                   indicatorColor: Colors.white,
//                   indicatorWeight: 1.0,
//                   isScrollable: true,
//                   tabs: [
//                     Tab(text: "Información básica"),
//                     Tab(text: "Experiencia laboral"),
//                     Tab(text: "Formación académica"),
//                     Tab(text: "Trayectoria partidaria"),
//                     Tab(text: "Declaración jurada"),
//                   ],
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Container(
//                 color: Colors.blue,
//                 height: 200.0,
//                 child: Padding(
//                   padding: EdgeInsets.all(0.0),
//                   child: TabBarView(
//                     children: [
//                       Page1(),
//                       Text("Hola 2"),
//                       Text("Hola 3"),
//                       Text("Hola 4"),
//                       Text("Hola 4.1"),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class DetailScreenEx extends StatefulWidget {
  const DetailScreenEx({super.key});

  @override
  State<DetailScreenEx> createState() => _DetailScreenExState();
}

class _DetailScreenExState extends State<DetailScreenEx> {
  final Cv cv = Get.arguments;
  late Future<User> res;
  final HomeController _homeController = HomeController();

  @override
  void initState() {
    res = _homeController.getUserInformation(cv.idHojaVida.toInt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var idHojaVida = cv.idHojaVida.toInt();
    var idOrgPol = cv.idOrganizacionPolitica.toInt();
    final List<String> tabs = <String>[
      S.current.txtBasicInformation,
      S.current.txtWorkExperience,
      S.current.txtAcademicFormation,
      S.current.txtPartialPosition,
      S.current.txtSwornDeclaration,
      S.current.txtListOfJudgments,
      S.current.txtAditionalInformation
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        Container(
                          height: 80.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 4.0,
                            bottom: 4.0,
                          ),
                          height: 160,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(
                                // child: Image.network(
                                //   "${S.current.urlPhotoResume}/$idHojaVida.jpg",
                                // ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${S.current.urlPhotoResume}/$idHojaVida.jpg",
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          OShimmerEffect(
                                    width: 10,
                                    height: double.maxFinite,
                                  ),
                                  //         LinearProgressIndicator(
                                  //   value: downloadProgress.progress,
                                  //   minHeight: 1.0,
                                  //   color: Colors.grey,
                                  // ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Expanded(
                                // child: Image.network(
                                //   "${S.current.urlPoliticalGroupSymbol}/$idOrgPol",
                                // ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${S.current.urlPoliticalGroupSymbol}/$idOrgPol",
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          LinearProgressIndicator(
                                    value: downloadProgress.progress,
                                    color: kDarkBlue,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: kDarkBlue,
                  title: Text(
                    cv.nombreCompleto,
                    style: const TextStyle(color: Colors.white),
                  ),
                  pinned: true,
                  expandedHeight: 290,
                  //elevation: 10.0,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    //labelColor: Colors.white,
                    labelStyle: const TextStyle(color: Colors.white),
                    unselectedLabelColor: Colors.grey,
                    tabs: tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: FutureBuilder(
            future: res,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return TabBarView(
                  children: [
                    //DetailInformation(snapshot.data!),
                    DetailBasicInformationX(snapshot.data!.datoGeneral),
                    DetailWorkExperienceX(snapshot.data!.experienciaLaboral),
                    DetailAcademicFormationX(snapshot.data!.formacionAcademica),
                    DetailTrajectoryX(snapshot.data!.trayectoria),
                    DetailSwornDeclarationX(snapshot.data!.declaracionJurada),
                    DetailSentenceX(snapshot.data!.sentenciaPenal),
                    DetailAditionalInformationX(
                        snapshot.data!.informacionAdicional),
                  ],
                );
                //return DetailInformation(snapshot.data!);
              }
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.black45,
                  strokeWidth: 2.0,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: kDarkBlue,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
