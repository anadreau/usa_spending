import 'package:creator/creator.dart';
import 'package:http/http.dart' as http;

//TO-DO: #1 Create Api for different https://api.usaspending.gov endpoints. @anadreau

///Creator for getStateOverview
Creator<Future<String>> stateOverviewCreator =
    Creator((ref) => StateOverviewService().getStateOverview());

///SpendingApi Class
class StateOverviewService {
  ///Using /api/v2/recipient/state/ get overview of States
  Future<String> getStateOverview() async {
    final url = Uri.https('api.usaspending.gov', '/api/v2/recipient/state/');
    final response = await http.get(url);
    return response.body;
  }
}

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
