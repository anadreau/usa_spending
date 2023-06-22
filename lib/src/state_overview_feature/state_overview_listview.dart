import 'package:flutter/material.dart';
import 'package:usa_spending/src/api/state_overview_model.dart';
import 'package:usa_spending/src/state_overview_feature/state_overview_card.dart';

///Listview for StateOverview Cards
class StateOverviewListView extends StatelessWidget {
  ///StateOverviewListView Constructor
  const StateOverviewListView({required this.statesList, super.key});

  ///Initialize List of States
  final List<StateOverviewModel> statesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(75, 15, 75, 15),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: statesList.length,
        restorationId: 'stateOverviewListView',
        itemBuilder: (context, index) {
          return StateOverviewCard(state: statesList[index]);
        },
      ),
    );
  }
}
