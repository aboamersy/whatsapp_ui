import 'package:flutter/material.dart';

class SilverAppBarWidget extends StatefulWidget {
  const SilverAppBarWidget({
    Key? key,
    required this.appBarHeight,
    required this.tabBarHeight,
    required this.controller,
    required this.maxTabBarHeight,
  }) : super(key: key);
  final double appBarHeight;
  final double tabBarHeight;
  final TabController controller;
  final double maxTabBarHeight;
  @override
  State<SilverAppBarWidget> createState() => _SilverAppBarWidgetState();
}

class _SilverAppBarWidgetState extends State<SilverAppBarWidget> {
  bool isSearchPressed = false;
  final Duration animationDuration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: widget.appBarHeight,
      backgroundColor: Colors.teal,
      actions: [
        AnimatedSwitcher(
          duration: animationDuration,
          child: !isSearchPressed
              ? Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSearchPressed = true;
                        });
                      },
                      child: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.more_vert,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                )
              : Container(),
        ),
      ],
      title: AnimatedSwitcher(
        duration: animationDuration,
        child: !isSearchPressed
            ? const Text('Whatsapp Business')
            : Row(
                children: [
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        isSearchPressed = false;
                      });
                    }),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(widget.tabBarHeight),
        child: SizedBox(
          height: widget.tabBarHeight,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                controller: widget.controller,
                isScrollable: true,
                tabs: [
                  Opacity(
                    opacity: widget.tabBarHeight / widget.maxTabBarHeight,
                    child: SizedBox(
                      width: 1,
                      height: 20,
                      child: Stack(clipBehavior: Clip.none, children: const [
                        Positioned(
                          left: -10,
                          child: Icon(
                            Icons.camera_alt,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                    child: Tab(
                      text: 'CHATS',
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                    child: Tab(
                      text: 'STATUS',
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                    child: Tab(
                      text: 'CALLS',
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
