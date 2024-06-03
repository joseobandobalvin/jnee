import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/controllers/home_controller.dart';
import 'package:jnee/generated/l10n.dart';
import 'package:jnee/models/cv.dart';
import 'package:jnee/screens/home/search_form.dart';
import 'package:jnee/widgets/card_stack.dart';
import 'package:jnee/widgets/global_widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Cv>> cv;
  final HomeController _homeController = HomeController();

  //var users = Get.arguments;

  @override
  void initState() {
    super.initState();
    cv = _homeController.getCandidates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlue,
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: kDarkBlue,
            actions: <Widget>[
              IconButton(
                onPressed: () async {
                  //Get.toNamed("/search");
                  await showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(Icons.search, color: Colors.white),
              )
            ],
            title: Text(
              S.current.txtHome,
              style: const TextStyle(color: Colors.white),
            ),
            //pinned: false,
            snap: true,
            floating: true,
            //expandedHeight: 60.0,
            elevation: 10.0,
            // flexibleSpace: FlexibleSpaceBar(
            //   title: Text('SliverAppBar'),
            // ),
          ),
          FutureBuilder(
            future: cv,
            builder: (context, snapshot) {
              var childCount = 0;

              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data!.isNotEmpty) {
                //print(snapshot);
                childCount = snapshot.data!.length;
                //print("childCount tiene $childCount datos");
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return CardStack(snapshot.data![index]);
                    },
                    childCount: childCount,
                  ),
                );
              }
              return const SliverToBoxAdapter(
                child: Center(
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.black45,
                    minHeight: 2,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
