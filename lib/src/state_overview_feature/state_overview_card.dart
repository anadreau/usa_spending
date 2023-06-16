import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usa_spending/src/api/state_overview_model.dart';

///StateOverviewCard Class
class StateOverviewCard extends StatelessWidget {
  ///StateOverviewCard Constructor
  const StateOverviewCard({required this.state, super.key});

  ///Initializes state [StateOverviewModel]
  final StateOverviewModel state;

  @override
  Widget build(BuildContext context) {
    //TO-DO: #2 Add state image asset to each card. @anadreau
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
      ),
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${state.type}: ${state.name}, ${state.code}'),
                  Text('Fips: ${state.fips}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //TO-DO: #3 Format dollar amount to include commas
                      // for readability. @anadreau
                      Text('\$${state.amount}'),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: SvgPicture.asset('assets/states/${state.code}.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
