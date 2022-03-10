import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:whatsapp_ui/src/ui/calls_screen/calls_screen.dart';
import 'package:whatsapp_ui/src/ui/camera_screen/camera_screen.dart';
import 'package:whatsapp_ui/src/ui/chats_screen/chats_screen.dart';
import 'package:whatsapp_ui/src/ui/main_screen/sliver_appbar.dart';
import 'package:whatsapp_ui/src/ui/status_screen/status_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
    required this.cameras,
  }) : super(key: key);
  final List<CameraDescription> cameras;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  late final ScrollController _scrollController;

  late double appBarHeight;
  late double tabBarHeight;
  final double maxAppBarHeight = 120;
  final double maxtabBarHeight = 50;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _tabController = TabController(length: 4, vsync: this)
      ..index = 1
      ..addListener(() {
        if (_tabController.index != 0) {
          _scrollController.jumpTo(0);
        } else if (_tabController.index == 0) {}
      });

    initAppBarAnimation();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  void initAppBarAnimation() {
    var tab = _tabController;
    var animation = _tabController.animation;
    appBarHeight = maxAppBarHeight;
    tabBarHeight = maxtabBarHeight;

    animation!.addListener(() {
      if (tab.index == 1) {
        hideAppBar(tab);
      } else if (tab.index == 0) {
        showAppBar(tab);
      }
    });
  }

  ///Called only when the current index is 1 (CHATS).
  void hideAppBar(TabController controller) {
    ///Offset needs to be negative
    if (controller.offset < 0) {
      setState(() {
        appBarHeight = maxAppBarHeight + (controller.offset * maxAppBarHeight);
        tabBarHeight = maxtabBarHeight + (controller.offset * maxtabBarHeight);
      });
    }
  }

  ///Called only when the current index is 0 (CAMERA).
  void showAppBar(TabController controller) {
    ///Offset needs to be positve
    if (controller.offset > 0) {
      setState(() {
        appBarHeight = controller.offset * maxAppBarHeight;
        tabBarHeight = controller.offset * maxtabBarHeight;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SilverAppBarWidget(
              controller: _tabController,
              appBarHeight: appBarHeight,
              tabBarHeight: tabBarHeight,
              maxTabBarHeight: maxtabBarHeight,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            CameraScreen(
              cameras: widget.cameras,
            ),
            const ChatsScreen(),
            const StatusScreen(),
            const CallsScreen(),
          ],
        ));
  }
}
