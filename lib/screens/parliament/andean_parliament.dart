import 'package:flutter/material.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/controllers/parliament_controller.dart';
import 'package:jnee/generated/l10n.dart';
import 'package:jnee/models/parliament/parliament.dart';
import 'package:jnee/screens/parliament/widgets/card_parliament.dart';
import 'package:jnee/widgets/global_widgets/custom_drawer.dart';
import 'package:rive/rive.dart';

class AndeanParliamentScreen extends StatefulWidget {
  const AndeanParliamentScreen({super.key});

  @override
  State<AndeanParliamentScreen> createState() => _AndeanParliamentScreenState();
}

class _AndeanParliamentScreenState extends State<AndeanParliamentScreen> {
  late Future<List<Parliament>> parliaments;
  final ParliamentController _parliamentController = ParliamentController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parliaments = _parliamentController.getParliaments(context);
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
                onPressed: () async {},
                icon: const Icon(Icons.more_vert, color: Colors.white),
              ),
            ],
            title: Text(
              S.current.txAndeanParliament,
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
          //buildPostsView(context),
          FutureBuilder(
            future: parliaments,
            builder: (context, snapshot) {
              var childCount = 0;

              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data!.isNotEmpty) {
                  childCount = snapshot.data!.length;

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return CardParliament(snapshot.data![index]);
                      },
                      childCount: childCount,
                    ),
                  );
                } else {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        height: 500,
                        child: RiveAnimation.asset(
                          'assets/rive/black-cat-nobg.riv',
                          stateMachines: ["State Machine 1"],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                }
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
