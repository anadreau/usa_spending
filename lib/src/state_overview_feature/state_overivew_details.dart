import 'package:creator/creator.dart';
import 'package:flutter/material.dart';
import 'package:usa_spending/src/api/spending_service.dart';

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
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Text(snapshot.data.toString()),
                );
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
