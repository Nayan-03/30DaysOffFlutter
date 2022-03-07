// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/drawer_items.dart';
import 'package:flutter_application_1/models/drawer_item.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:provider/provider.dart';

import 'navigation_provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final SafeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    final provider = Provider.of<NavigationProvider>(context);
    final isCollapsed = provider.isCollapsed;

    return SizedBox(
      width: isCollapsed ? MediaQuery.of(context).size.width * 0.2 : null,
      child: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.red],
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24).add(SafeArea),
                width: double.infinity,
                color: Colors.white12,
                child: buildHeader(isCollapsed),
              ),
              const SizedBox(height: 24),
              buildList(items: itemsFirst, isCollapsed: isCollapsed),
              const SizedBox(height: 24),
              const Divider(color: Colors.white70),
              const SizedBox(height: 24),
              const Spacer(),
              buildCollapseIcon(context, isCollapsed),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(bool isCollapsed) => isCollapsed
      ? const FlutterLogo(size: 48)
      : Row(
          children: const [
            SizedBox(width: 24),
            FlutterLogo(size: 48),
            SizedBox(width: 16),
            Text(
              "Flutter",
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ],
        );

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    const double size = 52;
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : const EdgeInsets.only(right: 16);
    final width = isCollapsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: SizedBox(
            width: width,
            height: size,
            child: Icon(icon, color: Colors.white),
          ),
          onTap: () {
            final provider =
                Provider.of<NavigationProvider>(context, listen: false);

            provider.toggleTsCollapsed();
          },
        ),
      ),
    );
  }

  Widget buildList({
    required bool isCollapsed,
    required List<DrawerItem> items,
  }) =>
      ListView.separated(
        padding: isCollapsed ? EdgeInsets.zero : padding,
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = items[index];

          return buildMenuItem(
            isCollapsed: isCollapsed,
            text: item.title,
            icon: item.icon,
            onClicked: () => selectItem(context, index),
          );
        },
      );

  Widget buildMenuItem({
    required bool isCollapsed,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const Color = Colors.white;
    final leading = Icon(icon, color: Color);

    return Material(
      color: Colors.transparent,
      child: isCollapsed
          ? ListTile(
              title: leading,
              onTap: onClicked,
            )
          : ListTile(
              leading: leading,
              title: Text(text,
                  style: const TextStyle(color: Color, fontSize: 16)),
              onTap: onClicked,
            ),
    );
  }

  selectItem(BuildContext context, int index) {
    final navigateTo = (page) => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));

    switch (index) {
      case 0:
        Navigator.of(context).pop();
        navigateTo(const ProfilePage());
        break;
      case 2:
        Navigator.of(context).pushNamed(MyRoutes.loginRoute);
        break;
    }
  }
}
