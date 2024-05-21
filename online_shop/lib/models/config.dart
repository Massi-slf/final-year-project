class Config{
   static const apiUrl = "http://192.168.254.69:8000";
   static const paymentBaseUrl = "paymentserver-production.up.railway.app";
  static const String loginUrl = "/api/jwt/login/";
  static const String paymentUrl = "/stripe/create-checkout-session";
  static const String signupUrl = "/api/users/signup/";
  static const String getCartUrl = "/api/cart/find";
  static const String addCartUrl = "/api/cart";
  static const String getUserUrl = "/api/users/";
  static const String sneakers = "/api/products";
  static const String orders = "/api/orders";
  static const String search = "/api/products/search/";
  static const String profile = "/api/products/search/";
}
