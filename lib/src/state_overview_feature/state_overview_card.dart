import 'package:flutter/material.dart';
import 'package:usa_spending/src/api/state_overview_model.dart';

class StateOverviewCard extends StatelessWidget {
  const StateOverviewCard({required this.state, super.key});
  final StateOverviewModel state;

  @override
  Widget build(BuildContext context) {
    //TO-DO: #2 Add state image asset to each card. @anadreau
    return Container(
      padding: const EdgeInsets.all(200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
      ),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${state.type}: ${state.name}, ${state.code}'),
            Text('Fips: ${state.fips}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$${state.amount}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
