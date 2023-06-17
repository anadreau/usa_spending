import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:usa_spending/src/api/state_overview_model.dart';

///StateOverviewCard Class
class StateOverviewCard extends StatelessWidget {
  ///StateOverviewCard Constructor
  const StateOverviewCard({required this.state, super.key});

  ///Initializes state [StateOverviewModel]
  final StateOverviewModel state;

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(
      locale: 'en_US',
      decimalDigits: 2,
      symbol: r'$ ',
    );
    final amount = formatCurrency.format(state.amount);
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${state.type}: ${state.name}, ${state.code}'),
                  Text('Fips: ${state.fips}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(amount),
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              //TO-DO: #13 look into adding svg for territories. @anadreau
              Expanded(
                child: SvgPicture.asset('assets/states/${state.code}.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
