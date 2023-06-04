import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pbm_uas/src/props/theme/textfont.dart';
import 'package:pbm_uas/src/views/post/post_create_view.dart';

import '../../controller/state/scroll/scroll_provider.dart';
import '../../props/paints/login_paint.dart';
import '../../props/widgets/custom_text_button.dart';
import '../../props/widgets/custom_text_field.dart';
import '../post/post_create_view.dart';
import '../profile/profile_page_view.dart';

class HomePageView extends ConsumerStatefulWidget {
  HomePageView({super.key});

  @override
  ConsumerState<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends ConsumerState<HomePageView> {
  late ScrollController controller;
  late List pages;

  late double width;
  late double height;

  @override
  void initState() {
    super.initState();
    Size screenSize = WidgetsBinding.instance.window.physicalSize;

    width = screenSize.width;
    height = screenSize.height;

    controller = ScrollController();
    pages = [
      PostPageView(controller: controller),
      PostCreatePageView(width: width, height: height),
      ProfilePageView(),
    ];
  }

  @override
  void dispose() {
    controller.dispose();

    print('dispossed');
    super.dispose();
  }

  int toRender = 0;

  @override
  Widget build(BuildContext context) {
    bool _isKepencetHome = (toRender == 0);
    bool _isKepencetProfile = (toRender == 2);

    void updateScroll() {
      if (controller.hasClients) {
        ref
            .read(scrollPositionProvider.notifier)
            .updateScrollPosition(controller.offset);
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: const TextAppBar(text: 'Photonism'),
      ),
      body: Stack(
        children: [
          pages[toRender],
          Container(
            padding: const EdgeInsets.all(30.0),
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15),
                      child: Material(
                        color: _isKepencetHome
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: InkWell(
                          splashColor: _isKepencetProfile
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          onTap: () {
                            setState(() {
                              toRender = 0;
                            });
                          },
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.home_rounded,
                                    color: _isKepencetHome
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: TextNavbar(
                                    text: 'Home',
                                    color: _isKepencetHome
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Material(
                          color: Colors.white, // button color
                          child: InkWell(
                            splashColor:
                                Theme.of(context).primaryColor, // inkwell color
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                size: 50,
                                Icons.add,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            onTap: () {
                              updateScroll();
                              setState(() {
                                toRender = 1;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15),
                      child: Material(
                        color: _isKepencetProfile
                            ? Colors.white
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: InkWell(
                          splashColor: _isKepencetHome
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          onTap: () {
                            updateScroll();
                            setState(() {
                              toRender = 2;
                            });
                          },
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.person,
                                    color: _isKepencetProfile
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: TextNavbar(
                                    text: 'Profile',
                                    color: _isKepencetProfile
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PostPageView extends ConsumerStatefulWidget {
  PostPageView({
    super.key,
    required this.controller,
  });

  ScrollController controller;

  @override
  ConsumerState<PostPageView> createState() => _PostPageViewState();
}

class _PostPageViewState extends ConsumerState<PostPageView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    print("IM initState 1");
    _scrollController = widget.controller;
    super.initState();
  }

  @override
  void dispose() {
    print("IM GOT DISPOSED");
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   print(_scrollController.offset);
    // });
    // print(_scrollController.position);
    // ref
    //     .read(scrollPositionProvider)
    //     .updateScrollPosition(_scrollController.offset);
    // _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        ref.read(scrollPositionProvider.notifier).state,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CardPostView(),
            CardPostView(),
            CardPostView(),
            CardPostView(),
            CardPostView(),
          ],
        ),
      ),
    );
  }
}

class PostPageView2 extends StatefulWidget {
  const PostPageView2({
    super.key,
  });

  @override
  State<PostPageView2> createState() => _PostPageViewState2();
}

class _PostPageViewState2 extends State<PostPageView2> {
  @override
  void initState() {
    print("IM initState 2");
    super.initState();
  }

  @override
  void dispose() {
    print("IM GOT DISPOSED 2");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CardPostView(),
            CardPostView(),
          ],
        ),
      ),
    );
  }
}

class CardPostView extends StatelessWidget {
  const CardPostView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                AvatarUserIcon(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextJudul1(
                        text: 'Avatar',
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      TextDeskripsi1(
                        text: 'Deskripsi',
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
              ),
              height: 400,
              padding: const EdgeInsets.all(1),
              child: Image.asset(
                fit: BoxFit.cover,
                'assets/images/noimage2.png',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      customBorder: const CircleBorder(),
                      splashFactory: NoSplash.splashFactory,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          size: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      customBorder: const CircleBorder(),
                      splashFactory: NoSplash.splashFactory,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.share,
                          size: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [Icon(Icons.location_pin), Text('Lokasi')],
                    ))
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextJudul1(
                    text: 'Avatar',
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextDeskripsi1(
                    text:
                        'Deskripsssssssssssssssssssssssssssssssssssasdasdasdawasdwasdawsdasdawasdawdasdawdasdwadwsssi',
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarUserIcon extends StatelessWidget {
  const AvatarUserIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox.fromSize(
          size: const Size.fromRadius(25),
          child: Image.asset('assets/images/noimage.png')),
    );
  }
}
