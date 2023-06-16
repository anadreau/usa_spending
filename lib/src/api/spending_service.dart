import 'package:creator/creator.dart';
import 'package:http/http.dart' as http;

///Creator for getStateOverview
Creator<Future<String>> stateOverviewCreator =
    Creator((ref) => StateOverviewService().getStateOverview());

//TO-DO: #4 Create Isar cache
//so not pulling from API on every refresh. @anadreau

///SpendingApi Service Class
class StateOverviewService {
  ///Using /api/v2/recipient/state/ get overview of States
  Future<String> getStateOverview() async {
    final url = Uri.https('api.usaspending.gov', '/api/v2/recipient/state/');
    final response = await http.get(url);
    return response.body;
  }

  //TO-DO: #8 add future API calls here such as search. @anadreau
}

//TO-DO: #5 Implement Status in API call for better error handling. @anadreau
///enum for api request status
enum Status {
  ///Successful status
  successful(message: '200'),

  ///Malformed status
  malformed(message: '400'),

  ///ServerError status
  serverError(message: '500');

  const Status({required this.message});

  ///Instancee of Status message
  final String message;
}
