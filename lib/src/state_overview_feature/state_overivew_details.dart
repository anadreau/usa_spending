import 'dart:convert';
import 'dart:developer';

import 'package:creator/creator.dart';
import 'package:flutter/material.dart';
import 'package:usa_spending/src/api/spending_service.dart';
import 'package:usa_spending/src/state_overview_feature/state_overview_listview.dart';

/// Displays detailed information about a SampleItem.
class StateOverviewDetails extends StatelessWidget {
  ///SampleItemDetailsView Constructor
  const StateOverviewDetails({super.key});

  ///Initialize routeName
  static const routeName = '/state_overview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Overview'),
      ),
      body: Center(
        child: Watcher((context, ref, child) {
          return FutureBuilder(
            future: ref.read(stateOverviewCreator),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
//                 const testString = '''
// [{"fips":"01","code":"AZ","name":"Arizona","type":"state","amount":420.69}
// ,
// {"fips":"02","code":"AK","name":"Alaska",
// "type":"state","amount":14582683693.39}]
// ''';
                final snapshotString = snapshot.data;
                final json = jsonDecode(snapshotString!) as List<dynamic>;

                log(json.toString());
                return StateOverviewListView(
                  statesList: json,
                );
                // return SingleChildScrollView(
                //   child: Text(snapshot.data.toString()),
                // );
              } else {
                return const CircularProgressIndicator();
              }
            },
          );
        }),
      ),
    );
  }
}
