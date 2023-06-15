class Api with ConstApi, AuthEndpoint, UserEndpoint {}

mixin ConstApi {
  String url = "localhost:8080";
}

mixin AuthEndpoint {
  String createAccount = "/auth/create";
  String login = "/auth/login";
}

mixin UserEndpoint {
  String createOrder = "/user/create_order";
  String readAll = '/user/get_orders';
  String readID = '/user/read_order/';
}
