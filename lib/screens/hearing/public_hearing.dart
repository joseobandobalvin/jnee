import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/controllers/hearing_controller.dart';
import 'package:jnee/generated/l10n.dart';
import 'package:jnee/models/hearing/hearing.dart';
import 'package:jnee/screens/hearing/widgets/card_hearing.dart';
import 'package:jnee/widgets/dialogs.dart';
import 'package:jnee/widgets/global_widgets/custom_drawer.dart';

class PublicHearingScreen extends StatefulWidget {
  const PublicHearingScreen({super.key});

  @override
  State<PublicHearingScreen> createState() => _PublicHearingScreenState();
}

class _PublicHearingScreenState extends State<PublicHearingScreen> {
  late Future<List<Hearing>> ph;
  final HearingController _hearingController = HearingController();

  late List<Hearing> _posts;

  final disStar = 0.obs;
  final disLen = 8.obs;
  final sorDi = "asc".obs;
  RxBool isLoading = false.obs;
  RxBool _error = false.obs;

  final reachedEnd = false.obs;

  void onScrollListener() {
    print("onScrollListener " + reachedEnd.value.toString());
    if (reachedEnd.value) {
      return;
    }
    if (isLoading.value == false) {
      isLoading.value = true;

      Future.microtask(() async {
        print("disStar =====> $disStar");
        final newHearings = await _hearingController.getList(
          context,
          displayStart: disStar.value,
          displayLength: disLen.value,
          sortDir: sorDi.value,
        );

        //print(newHearings[0].txFecha);
        if (newHearings.length < disLen.value) {
          reachedEnd.value = true;
          if (newHearings.isEmpty) {
            isLoading.value = false;
            _error.value = true;
          }
        } else {
          disStar.value = disStar.value + disLen.value;
        }

        // } else {
        //   nextPage.value++;
        // }

        //allFlowers.value.add(newHearings);
        isLoading.value = false;
        setState(() {
          _posts.addAll(newHearings);
        });
        //isLoading.value = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _posts = [];

    onScrollListener();

    // ph = _hearingController.getList(
    //   context,
    //   displayStart: disStar.value,
    //   displayLength: disLen.value,
    //   sortDir: sorDi.value,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlue,
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          // if (scrollNotification is ScrollEndNotification) {
          //   onScrollListener();
          // }
          if (scrollNotification.metrics.pixels ==
              scrollNotification.metrics.maxScrollExtent) {
            onScrollListener();
          }

          return true;
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: kDarkBlue,
              actions: <Widget>[
                IconButton(
                  onPressed: () async {
                    var t = await Dialogs.confirmFilters(context,
                        title: S.current.txtFilterBy);
                    print("Confirmandroid =====> " + t.toString());
                    reachedEnd.value = false;
                    disStar.value = 0;
                    _posts.clear();
                    print("_posts");
                    print(_posts);
                    onScrollListener();
                  },
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                ),
              ],
              title: Text(
                S.current.txPublicHearing,
                style: const TextStyle(color: Colors.white),
              ),
              //pinned: false,
              snap: true,
              floating: true,
              //expandedHeight: 60.0,
              elevation: 10.0,
              // flexibleSpace: const FlexibleSpaceBar(
              //   title: Text('SliverAppBar'),
              // ),
            ),
            buildPostsView(context),
            // FutureBuilder(
            //   future: ph,
            //   builder: (context, snapshot) {
            //     var childCount = 0;

            //     if (snapshot.connectionState == ConnectionState.done &&
            //         snapshot.data!.isNotEmpty) {
            //       childCount = snapshot.data!.length;

            //       return SliverList(
            //         delegate: SliverChildBuilderDelegate(
            //           (BuildContext context, int index) {
            //             return CardHearing(snapshot.data![index]);
            //           },
            //           childCount: childCount,
            //         ),
            //       );
            //     }
            //     return const SliverToBoxAdapter(
            //       child: Center(
            //         child: LinearProgressIndicator(
            //           backgroundColor: Colors.white,
            //           color: Colors.black45,
            //           minHeight: 2,
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildPostsView(BuildContext c) {
    if (_posts.isEmpty) {
      if (isLoading.value == true) {
        return const SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        );
      } else if (_error.value) {
        return SliverToBoxAdapter(
          child: Center(
            child: errorDialog(
              size: 14,
            ),
          ),
        );
      }
    }

    var childCount = _posts.length;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          print("$index ===== " + _posts.length.toString());

          if (index == _posts.length) {
            if (_error.value) {
              return SliverToBoxAdapter(
                child: Center(
                  child: errorDialog(size: 15),
                ),
              );
            } else {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }
          }
          return CardHearing(_posts[index]);
        },
        childCount: childCount,
      ),
    );
  }

  Widget errorDialog({required double size}) {
    return Column(
      children: [
        //const SizedBox(height: 200),
        Text(
          textAlign: TextAlign.center,
          'Se ha producido un error al recuperar los datos.',
          style: TextStyle(
              fontSize: size, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(height: 10),
        TextButton(
            onPressed: () {
              reachedEnd.value = false;
              isLoading.value = false;
              _error.value = false;
              setState(() {
                onScrollListener();
              });
            },
            child: const Text(
              "Reintentar",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            )),
      ],
    );
  }
}
