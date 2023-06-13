//TO-DO: #1 Create Api for different https://api.usaspending.gov endpoints. @anadreau
///SpendingApi Class
class StateOverview {
  //Using /api/v2/recipient/state/
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
