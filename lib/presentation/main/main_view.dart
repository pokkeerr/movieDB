import 'package:flutter/material.dart';
import 'package:movedb/data/models/person_actor.dart';
import 'package:movedb/data/repository/persone_repo.dart';

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
      body: FutureBuilder<List<PersonActor>>(
          future: PersonRepository.getPopularPeople(),
          builder: (c, s) {
            if (s.hasData) {
              if (s.data?.isNotEmpty ?? false) {
                return ListView.builder(
                    itemCount: s.data?.length ?? 0,
                    itemBuilder: (ctx, i) {
                      return ListTile(
                        title: Text(s.data![i].name),
                        subtitle: Text(s.data![i].imdbId),
                      );
                    });
              }
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
