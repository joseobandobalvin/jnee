import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jnee/configs/themes/app_colors.dart';
import 'package:jnee/generated/l10n.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          curve: Curves.easeInSine,
          duration: Duration(milliseconds: 20),
          decoration: BoxDecoration(
            color: kDarkBlue,
          ),
          child: Text(''),
        ),
        ListTile(
          leading: const Icon(
            Icons.home_filled,
            color: Colors.black,
          ),
          title: const Text('Inicio'),
          onTap: () {
            Get.offAllNamed(S.current.routeHome);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.filter_list,
            color: Colors.black,
          ),
          title: const Text('Lista por Región'),
          onTap: () {
            Get.offAllNamed(S.current.routeOrganizationFilter);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.donut_small,
            color: Colors.black,
          ),
          title: Text(S.current.txAndeanParliament),
          onTap: () {
            Get.offAllNamed(S.current.routeParliament);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.gavel_outlined,
            color: Colors.black,
          ),
          title: Text(S.current.txPublicHearing),
          onTap: () {
            Get.offAllNamed(S.current.routePublicHearing);
          },
        ),
      ],
    );
  }
}
