import 'package:flutter/material.dart';
import 'package:movedb/app/constants.dart';
import 'package:movedb/data/repository/persone_repo.dart';
import 'package:movedb/presentation/ActorDeatils/actor_deatils_screen.dart';
import 'package:movedb/presentation/resources/values_manager.dart';

import '../../data/models/popular_persone.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // PersonRepository _personRepository = PersonRepository.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Popular People Actores')),
        body: FutureBuilder<PopularActors?>(
            future: PersonRepository.getPopularPeople(context),
            builder: (c, s) {
              if (s.hasData) {
                if (s.data != null) {
                  return ListView.builder(
                      itemCount: s.data!.results?.length ?? 0,
                      itemBuilder: (ctx, i) {
                        final actor = s.data!.results![i];
                        return Card(
                            margin: const EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(actor.name!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                ),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(children: [
                                        Stack(children: [
                                          InkWell(
                                              child: Hero(
                                                  tag: (actor.profilePath ??
                                                      actor.id ??
                                                      " "),
                                                  child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              5),
                                                      height: 160,
                                                      width: 160,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  Constants.IMAGEPATH +
                                                                      (actor.profilePath ??
                                                                          " ")),
                                                              fit: BoxFit
                                                                  .cover)))),
                                              onTap: () async {
                                                // final ac = await PersonRepository
                                                //     .getPersoneByID(
                                                //         actor.id!, context);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (ctx) =>
                                                            ActorDeatilsScreen(
                                                                actor)));
                                              }),
                                          Positioned(
                                              right: 5,
                                              bottom: 5,
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                        decoration: const BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            4))),
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 4),
                                                        child: Row(children: [
                                                          Text(
                                                              actor.popularity!
                                                                  .toStringAsFixed(
                                                                      1),
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      12)),
                                                          const Icon(
                                                              Icons
                                                                  .people_alt_outlined,
                                                              color:
                                                                  Colors.white,
                                                              size: 12)
                                                        ])),
                                                  ])),
                                          Positioned(
                                              left: 5,
                                              bottom: 5,
                                              child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          4))),
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 4),
                                                  child: Text(
                                                      actor.knownForDepartment!,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                          fontSize: 12))))
                                        ]),
                                      ]),
                                      Expanded(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                            _knowsForWidget(actor),
                                          ])),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.more_vert))
                                    ]),
                              ],
                            ));
                      });
                }
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }

  Widget _knowsForWidget(PopulerActorResults actor) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        child: Column(
            children: actor.knownFor!
                .map<Widget>((e) => Row(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Hero(
                              tag: e.posterPath ?? e.id ?? " ",
                              child: Container(
                                  margin: const EdgeInsets.all(3),
                                  padding: const EdgeInsets.all(3),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${Constants.IMAGEPATH}${e.backdropPath}"),
                                          fit: BoxFit.cover))),
                            ),
                          ]),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                            Text(
                                e.originalTitle ??
                                    e.title ??
                                    e.originalLanguage ??
                                    " ",
                                style: const TextStyle(
                                    fontSize: AppSize.s13,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.clip)),
                            Row(children: [
                              const Icon(Icons.person_outline,
                                  size: AppSize.s16, color: Colors.grey),
                              Text(e.voteCount.toString(),
                                  style: const TextStyle(
                                      fontSize: AppSize.s12,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.clip))
                            ]),
                            Container(
                                decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("${e.voteAverage} ",
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      const Icon(Icons.star,
                                          color: Colors.white, size: 12)
                                    ]))
                          ]))
                    ]))
                .toList()));
  }
}
