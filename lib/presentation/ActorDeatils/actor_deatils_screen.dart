import 'package:flutter/material.dart';

import '../../app/constants.dart';
import '../../data/models/actor_deatils.dart';

class ActorDeatilsScreen extends StatefulWidget {
  final ActorDeatils actorDeatils;

  const ActorDeatilsScreen(this.actorDeatils, {Key? key}) : super(key: key);

  @override
  State<ActorDeatilsScreen> createState() => _ActorDeatilsScreenState();
}

class _ActorDeatilsScreenState extends State<ActorDeatilsScreen> {
  ActorDeatils? _actorDeatils;
  @override
  void initState() {
    _actorDeatils = widget.actorDeatils;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    expandedHeight: _h * .43,
                    pinned: true,
                    floating: true,
                    forceElevated: innerBoxIsScrolled,
                    flexibleSpace: FlexibleSpaceBar(
                        background:
                            Stack(alignment: Alignment.center, children: [
                      Hero(
                        tag: _actorDeatils!.profilePath!,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                  image: NetworkImage(Constants.IMAGEPATH +
                                      _actorDeatils!.profilePath!),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      const Positioned(
                          left: 1,
                          bottom: 1,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: 18.0, left: 10, right: 10),
                              child: Expanded(
                                  child: Text(
                                      "Python course full guide masteras dasd ad ad ad a",
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22)))))
                    ])))
              ];
            },
            body: Scaffold(
              body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List<Widget>.generate(
                              6,
                              (i) => Container(
                                    child: Text(i.toString()),
                                  )).toList()))),
            )));
  }
}
