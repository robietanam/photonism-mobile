import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:pbm_uas/src/models/api.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/posts/provider/posts_provider.dart';
import '../../controller/state/scroll/scroll_provider.dart';
import '../../models/posts.dart';
import '../../models/users.dart';
import '../../props/theme/textfont.dart';
import '../../props/widgets/alert.dart';

import 'package:http/http.dart' as http;

import 'post_edit_view.dart';

class PostPageView extends ConsumerStatefulWidget {
  PostPageView({
    super.key,
    required this.controller,
    required this.user,
  });

  final ScrollController controller;
  final User user;

  @override
  ConsumerState<PostPageView> createState() => _PostPageViewState();
}

class _PostPageViewState extends ConsumerState<PostPageView> {
  late ScrollController _scrollController;
  late User user;
  @override
  void initState() {
    _scrollController = widget.controller;
    user = widget.user;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref
          .read(postsNotifierProvider.notifier)
          .getPosts(user: user, start: start, banyak: banyak);
    });

    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   final scrollOffset = ref.watch(scrollPositionProvider);
    //   if (_scrollController.hasClients) {
    //     _scrollController.animateTo(
    //       scrollOffset,
    //       duration: Duration(milliseconds: 500),
    //       curve: Curves.easeInOut,
    //     );
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
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

  bool _isLoading = false;
  List<Post> posts = [];

  int start = 0;
  int banyak = 9;
  bool mounted = false;
  bool stopIfNotDone = false;
  bool isItDone = false;
  int oldLength = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    print("start : ${start}");
    ref.watch(postsNotifierProvider).maybeWhen(
      orElse: () {
        _isLoading = false;
      },
      initial: () {
        stopIfNotDone = true;
      },
      loading: () {
        _isLoading = true;
        stopIfNotDone = true;
      },
      failed: (message) {
        if (_isLoading) {
          _isLoading = false;
        }
        SchedulerBinding.instance.addPostFrameCallback((_) {
          myAlertError(
              context: context, text: message ?? 'Telah terjadi error');
        });
      },
      fetchedArrayDone: (done) {
        isItDone = true;
      },
      fetchedArray: (postsData) {
        stopIfNotDone = false;
        if (_isLoading) {
          _isLoading = false;
        }
        print(postsData.posts);
        posts.addAll(postsData.posts);
      },
    );

    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          start = 0;
          posts = [];
          isItDone = false;
          ref
              .watch(postsNotifierProvider.notifier)
              .getPosts(user: user, start: start, banyak: banyak);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: (posts.isNotEmpty)
            ? ListView.builder(
                controller: _scrollController,
                itemCount: posts.length + 1,
                itemBuilder: (context, index) {
                  print(posts.length);

                  if (index == posts.length) {
                    if (isItDone) {
                      return Text('Tidak ada posts untuk dilihat');
                    }
                    if (!stopIfNotDone) {
                      start += 10;
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        ref
                            .watch(postsNotifierProvider.notifier)
                            .getPosts(user: user, start: start, banyak: banyak);
                      });

                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ));
                    }
                  } else {
                    return CardPostView(
                      post: posts[index],
                      user: user,
                    );
                  }
                },
              )
            : (_isLoading)
                ? Center(child: CircularProgressIndicator())
                : Text('Tidak ada posts untuk dilihat disini'),
      ),
    );
  }
}

class CardPostView extends StatefulWidget {
  CardPostView({
    super.key,
    required this.post,
    required this.user,
  });
  final Post post;
  final User user;
  @override
  State<CardPostView> createState() => _CardPostViewState();
}

class _CardPostViewState extends State<CardPostView> {
  bool _isSelengkapnya = false;
  late Post post;
  late User user;
  late bool isLike;
  @override
  void initState() {
    super.initState();
    post = widget.post;
    user = widget.user;

    isLike = post.likes.contains(user.id);
  }

  Future<Response> fetchData(
      {required double latitude, required double longitude}) async {
    final response =
        http.get(Uri.https('nominatim.openstreetmap.org', 'reverse', {
      'format': 'json',
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'zoom': '18',
      'addressdetails': '1',
    }));

    return response;
  }

  Future<User> fetchUser({required String idUser}) async {
    final response = await http.get(
        Uri.https(
          ApiConstants.baseUrl,
          ApiConstants.userEndPoint(idUser),
        ),
        headers: {
          'Authorization': 'Bearer ${user.jwt}',
          'Content-type': 'application/json'
        });

    return User.fromJson(jsonDecode(response.body));
  }

  Future<bool> openMap(double latitude, double longitude) async {
    Uri googleUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
      return true;
    } else {
      return false;
      throw 'Could not open the map.';
    }
  }

  Future<bool> likeDislike(String idPost) async {
    final response = await http.put(
        Uri.https(ApiConstants.baseUrl, ApiConstants.likeDislike(idPost)),
        headers: {
          'Authorization': 'Bearer ${user.jwt}',
          'Content-type': 'application/json'
        });

    if (response.body.contains('unliked ')) {
      return false;
    } else {
      return true;
    }
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder(
                            future: fetchUser(idUser: post.userId),
                            builder: (context, snapshot) {
                              List<Widget> children;
                              if (snapshot.hasData) {
                                children = <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: AvatarUserIcon(
                                        imageLink: snapshot.data!.profileImage),
                                  ),
                                  TextJudul1(
                                    text: snapshot.data!.username,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                ];
                              } else if (snapshot.hasError) {
                                children = <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Image.asset(
                                      'assets/images/noimage.png',
                                      height: 70,
                                      width: 70,
                                    ),
                                  ),
                                  TextJudul1(
                                    text: 'Gagal mengambil user',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                ];
                              } else {
                                children = <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Center(
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextJudul1(
                                    text: 'Mengambil data ....',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                ];
                              }
                              return Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: children,
                                ),
                              );
                            },
                          ),
                          // FutureBuilder(
                          //   future: fetchData(
                          //       latitude: post.location[0].toDouble(),
                          //       longitude: post.location[1].toDouble()),
                          //   builder: (context, snapshot) {
                          //     List<Widget> children;
                          //     if (snapshot.hasData) {
                          //       String? theAddress;
                          //       final isAddress =
                          //           jsonDecode(snapshot.data!.body)['address'];

                          //       if (isAddress != null) {
                          //         theAddress = isAddress.values
                          //             .toList()
                          //             .getRange(0, 3)
                          //             .join(', ');
                          //       }
                          //       print(theAddress);
                          //       children = <Widget>[
                          //         TextDeskripsi1(
                          //           text: (isAddress != null &&
                          //                   theAddress != null)
                          //               ? theAddress
                          //               : "Alamat tidak ditemukan",
                          //           color: Theme.of(context)
                          //               .colorScheme
                          //               .onSecondary,
                          //         ),
                          //       ];
                          //     } else if (snapshot.hasError) {
                          //       print(snapshot.error);
                          //       children = <Widget>[
                          //         TextDeskripsi1(
                          //           text: 'Error mengambil data lokasi',
                          //           color: Theme.of(context)
                          //               .colorScheme
                          //               .onSecondary,
                          //         ),
                          //       ];
                          //     } else {
                          //       children = <Widget>[
                          //         TextDeskripsi1(
                          //           text: 'Mengambil data ....',
                          //           color: Theme.of(context)
                          //               .colorScheme
                          //               .onSecondary,
                          //         ),
                          //       ];
                          //     }
                          //     return Center(
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: children,
                          //       ),
                          //     );
                          //   },
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
                (user.id == post.userId)
                    ? IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return PostEditPageView(
                                post: post,
                                user: user,
                              );
                            },
                          ));
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : Container(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CarouselSlider.builder(
                options: CarouselOptions(
                    viewportFraction: 1.0,
                    disableCenter: true,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    scrollDirection: axisDirectionToAxis(AxisDirection.right)),
                itemCount: post.photo.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  pageViewIndex += 1;

                  bool isZoom = false;
                  return Stack(
                    children: [
                      Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          height: 400,
                          width: 400,
                          padding: const EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhotoViewPage(
                                    imageUrl: post.photo,
                                    index: itemIndex,
                                  ),
                                ),
                              );
                            },
                            child: Image.network(
                              post.photo[itemIndex],
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  fit: BoxFit.cover,
                                  'assets/images/noimage2.png',
                                );
                              },
                              frameBuilder: (context, child, frame,
                                  wasSynchronouslyLoaded) {
                                if (frame != null || wasSynchronouslyLoaded) {
                                  return child;
                                }
                                return const Center(
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 5,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          )),
                      (post.photo.length > 1)
                          ? Container(
                              alignment: Alignment.bottomRight,
                              padding: EdgeInsets.all(10),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(131, 0, 0, 0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: TextJudul1(
                                  text:
                                      '${itemIndex + 1} / ${post.photo.length}',
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        likeDislike(post.postId).then((value) {
                          setState(() {
                            isLike = value;
                          });
                        });
                      },
                      customBorder: const CircleBorder(),
                      splashFactory: NoSplash.splashFactory,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: (isLike)
                            ? Icon(
                                Icons.favorite,
                                size: 28,
                                color: Theme.of(context).primaryColor,
                              )
                            : Icon(
                                Icons.favorite_border_outlined,
                                size: 28,
                                color: Theme.of(context).primaryColor,
                              ),
                      ),
                    ),
                    TextJudul1(
                      text: (post.likes.length +
                                  ((isLike && !post.likes.contains(user.id))
                                      ? 1
                                      : 0))
                              .toString() +
                          ' Suka',
                      color: Theme.of(context).primaryColor,
                    ),
                    // InkWell(
                    //   onTap: () {},
                    //   customBorder: const CircleBorder(),
                    //   splashFactory: NoSplash.splashFactory,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Icon(
                    //       Icons.share,
                    //       size: 28,
                    //       color: Theme.of(context).primaryColor,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      openMap(post.location[0].toDouble(),
                              post.location[1].toDouble())
                          .then((value) {
                        if (!value) {
                          myAlertError(
                              context: context, text: "Alamat tidak ditemukan");
                        }
                      });
                    },
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
                  TextDeskripsi1(
                    text: DateFormat('EEEE, dd-MM-yyyy', 'id_ID')
                        .format(post.updatedAt),
                    color: Colors.black45,
                  ),
                  TextJudul1(
                    text: 'Deskripsi',
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelengkapnya = !_isSelengkapnya;
                      });
                    },
                    child: TextDeskripsi1(
                      text: post.desc,
                      color: Theme.of(context).colorScheme.onSecondary,
                      isSelengkapnya: _isSelengkapnya,
                    ),
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
    required this.imageLink,
  });

  final String imageLink;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: SizedBox.fromSize(
        size: const Size.fromRadius(20),
        child: Image.network(
          imageLink,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/images/noimage.png',
              height: 70,
              width: 70,
            );
          },
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (frame != null || wasSynchronouslyLoaded) {
              return child;
            }
            return const Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: Colors.white,
                ),
              ),
            );
          },
          height: 70,
          width: 70,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PhotoViewPage extends StatelessWidget {
  final List<dynamic> imageUrl;
  final int index;
  const PhotoViewPage({super.key, required this.imageUrl, this.index = 0});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: index);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: PhotoViewGallery.builder(
        itemCount: imageUrl.length,
        pageController: pageController,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(imageUrl[index]),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 1.8,
            initialScale: PhotoViewComputedScale.contained,
          );
        },
      ),
    );
  }
}
