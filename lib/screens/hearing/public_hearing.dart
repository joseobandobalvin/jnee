import 'package:flutter/material.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/controllers/hearing_controller.dart';
import 'package:jnee/generated/l10n.dart';
import 'package:jnee/screens/hearing/widgets/card_hearing.dart';
import 'package:jnee/widgets/global_widgets/custom_drawer.dart';

class PublicHearingScreen extends StatefulWidget {
  const PublicHearingScreen({super.key});

  @override
  State<PublicHearingScreen> createState() => _PublicHearingScreenState();
}

class _PublicHearingScreenState extends State<PublicHearingScreen> {
  late Future ph;
  final HearingController _hearingController = HearingController();

  @override
  void initState() {
    super.initState();
    ph = _hearingController.getList(context);
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

            title: Text(
              S.current.txPublicHearing,
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
            future: ph,
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
                      return CardHearing(snapshot.data![index]);
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
