import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pbm_uas/src/props/theme/textfont.dart';
import 'package:pbm_uas/src/views/post/post_create_view.dart';

import '../../controller/posts/provider/posts_provider.dart';
import '../../controller/state/homepage/homepage_provider.dart';
import '../../controller/state/scroll/scroll_provider.dart';
import '../../controller/user/provider/user_provider.dart';
import '../../models/users.dart';
import '../../props/widgets/alert.dart';
import '../post/post_page_view.dart';
import '../post/post_popular_view.dart';
import '../profile/profile_page_view.dart';

class HomePageView extends ConsumerStatefulWidget {
  HomePageView({super.key, required this.user});

  final User user;
  @override
  ConsumerState<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends ConsumerState<HomePageView> {
  late ScrollController controller;
  late List pages;

  late User user;

  late double width;
  late double height;

  @override
  void initState() {
    super.initState();
    Size screenSize = WidgetsBinding.instance.window.physicalSize;

    width = screenSize.width;
    height = screenSize.height;

    user = widget.user;

    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();

    print('dispossed');
    super.dispose();
  }

  int toRender = 0;

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    toRender = ref.watch(pageWidgetProvider);
    pages = [
      PostPageView(controller: controller, user: user),
      PostCreatePageView(width: width, height: height, user: user),
      ProfilePageView(user: user),
      PostPopulerPageView(
        user: user,
      ),
    ];

    ref.watch(userDataNotifierProvider).maybeWhen(
      orElse: () {
        _isLoading = false;
      },
      loading: () {
        _isLoading = true;
        SchedulerBinding.instance.addPostFrameCallback((_) {
          myLoadingPopup(context: context).then((value) {
            _isLoading = false;
          });
        });
      },
      success: (userData) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (_isLoading) {
            Navigator.pop(context);
            _isLoading = false;
          }
          user = userData;
          myAlertSuccess(context: context, text: 'Data berhasil dirubah');
          ref.invalidate(userDataNotifierProvider);
        });
      },
      failed: (message) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (_isLoading) {
            Navigator.pop(context);
            _isLoading = false;
          }
          myAlertError(
              context: context, text: message ?? 'Telah terjadi error');
        });
      },
    );

    print(user.toJson());
    bool _isKepencetHome = (toRender == 0);
    bool _isKepencetProfile = (toRender == 2);
    bool _isKepencetPopuler = (toRender == 3);
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Material(
              color: _isKepencetPopuler
                  ? Colors.white
                  : Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: InkWell(
                splashColor: !_isKepencetPopuler
                    ? Colors.white
                    : Theme.of(context).primaryColor,
                onTap: () {
                  ref.watch(pageWidgetProvider.notifier).setPage(3);
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
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Center(
                          child: Icon(
                            Icons.star,
                            color: _isKepencetPopuler
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextNavbar(
                          text: 'Populer',
                          color: _isKepencetPopuler
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //   child: GestureDetector(
          //       onTap: () => ref.watch(pageWidgetProvider.notifier).setPage(3),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Icon(Icons.star),
          //           Text('Populer'),
          //         ],
          //       )),
          // )
        ],
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
                            print('kepencet');
                            if (_isKepencetHome) {
                              print('masuk');

                              controller.animateTo(
                                0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            }
                            ref.watch(pageWidgetProvider.notifier).setPage(0);
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
                              ref.read(pageWidgetProvider.notifier).setPage(1);
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
                            ref.read(pageWidgetProvider.notifier).setPage(2);
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
