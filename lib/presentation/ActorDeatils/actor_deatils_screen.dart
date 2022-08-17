import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/constants.dart';
import '../../data/models/actor_deatils.dart';
import '../../data/models/actor_images.dart';
import '../../data/models/popular_persone.dart';
import '../../data/repository/persone_repo.dart';
import '../resources/values_manager.dart';
import '../widgets/title.dart';

class ActorDeatilsScreen extends StatefulWidget {
  final PopulerActorResults actorResults;

  const ActorDeatilsScreen(this.actorResults, {Key? key}) : super(key: key);

  @override
  State<ActorDeatilsScreen> createState() => _ActorDeatilsScreenState();
}

class _ActorDeatilsScreenState extends State<ActorDeatilsScreen> {
  PopulerActorResults? _actorResults;
  ActorDeatils? _actorDeatils;
  @override
  void initState() {
    _actorResults = widget.actorResults;
    _getActorDeatils();
    super.initState();
  }

  Future<ActorDeatils?> _getActorDeatils() async {
    final pers =
        await PersonRepository.getPersoneByID(_actorResults!.id!, context);
    if (pers != null) {
      if (mounted) {
        setState(() {
          _actorDeatils = pers;
        });
      }
    }
    return pers;
  }

  late double _h;
  late double _w;
  @override
  Widget build(BuildContext context) {
    _h = MediaQuery.of(context).size.height;
    _w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    expandedHeight: _h * .5,
                    pinned: true,
                    floating: true,
                    forceElevated: innerBoxIsScrolled,
                    title: Text(_actorResults?.name ?? " ",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    flexibleSpace: FlexibleSpaceBar(
                        background:
                            Stack(alignment: Alignment.center, children: [
                      Hero(
                          tag: (_actorResults?.profilePath ??
                              _actorResults?.id ??
                              " "),
                          child: CachedNetworkImage(
                              height: _h * .55,
                              width: _w,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageUrl: Constants.IMAGEPATH +
                                  (_actorResults?.profilePath ?? " ")))
                    ])))
              ];
            },
            body: Scaffold(
                body: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                  if (_actorResults?.knownFor != null)
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const TitleWidget("Known For"),
                          _knowList()
                        ]),
                  if (_actorDeatils != null)
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const TitleWidget("Bio"),
                              Text(_actorDeatils?.biography ?? " ",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))
                            ])),
                  if (_actorDeatils != null)
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const TitleWidget("Info"),
                              _infoTable()
                            ])),
                  if (_actorDeatils != null)
                    Expanded(
                        child: FutureBuilder<ActorImages?>(
                            future: PersonRepository.getPersoneImagesByID(
                                _actorDeatils!.id!, context),
                            builder: (c, s) {
                              if (s.hasData) {
                                if (s.data != null) {
                                  return _imagesList(s.data);
                                }
                              }
                              return const SizedBox();
                            }))
                ]))));
  }

  Widget _knowList() {
    return SizedBox(
        height: _h * .3,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: _actorResults!.knownFor!
                .map<Widget>((e) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Hero(
                              tag: e.posterPath ?? e.id ?? " ",
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            height: 150,
                                            width: 150,
                                            alignment: Alignment.center,
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            imageUrl: Constants.IMAGEPATH +
                                                (e.posterPath ?? " "))),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(
                                                  width: 150,
                                                  child: Text(
                                                      e.originalTitle ??
                                                          e.title ??
                                                          e.originalLanguage ??
                                                          " ",
                                                      style: const TextStyle(
                                                          fontSize: AppSize.s13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          overflow: TextOverflow
                                                              .clip))),
                                              Row(children: [
                                                Text(e.voteCount.toString(),
                                                    style: const TextStyle(
                                                        fontSize: AppSize.s12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        overflow:
                                                            TextOverflow.clip)),
                                                const Icon(Icons.person_outline,
                                                    size: AppSize.s16),
                                              ]),
                                              Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text("${e.voteAverage} ",
                                                        style: const TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    const Icon(Icons.star,
                                                        size: 12)
                                                  ])
                                            ]))
                                  ]))
                        ]))
                .toList()));
  }

  Widget _imagesList(ActorImages? data) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const TitleWidget("Images"),
          SizedBox(
              height: ((data!.profiles?.length ?? 1) / 3).ceil() * 150,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: data.profiles?.length ?? 0,
                  itemBuilder: (ctx, i) {
                    return InkWell(
                        child: Hero(
                            tag: data.profiles![i].filePath!,
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: 120,
                                  alignment: Alignment.center,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  imageUrl:
                                      "${Constants.IMAGEPATH}${data.profiles![i].filePath}"),
                            )),
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (c) {
                                return AlertDialog(
                                    content: InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Hero(
                                            tag: data.profiles![i].filePath!,
                                            child: Image.network(
                                                "${Constants.IMAGEPATH}${data.profiles![i].filePath}",
                                                fit: BoxFit.cover))));
                              });
                        });
                  }))
        ]);
  }

  Widget _infoTable() {
    return Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.blue, width: 2)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: _actorDeatils!.toJson().keys.map((k) {
              final e = _actorDeatils!.toJson()[k];
              if (e is String &&
                  k != "biography" &&
                  k != "profile_path" &&
                  k != "imdb_id") {
                return Row(children: [
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.all(2.0),
                          padding: const EdgeInsets.all(2.0),
                          color: Colors.grey.withOpacity(0.3),
                          child: Text(k.replaceAll("_", " "),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold)))),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(2.0),
                          margin: const EdgeInsets.all(2.0),
                          color: Colors.grey.withOpacity(0.3),
                          child: InkWell(
                              child: Text(k == "homepage" ? "Home page" : e,
                                  style: (k == "homepage"
                                      ? const TextStyle(color: Colors.blue)
                                      : null)),
                              onTap: () async {
                                if (k == "homepage") {
                                  await launchUrl(Uri.parse(e));
                                }
                              })))
                ]);
              }
              return const SizedBox();
            }).toList()));
  }
}
