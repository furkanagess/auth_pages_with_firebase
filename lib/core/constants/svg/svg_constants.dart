class SVGConstants {
  SVGConstants._init();
  static SVGConstants? _instace;

  static SVGConstants get instance => _instace ??= SVGConstants._init();

  String toSVG(String name) => "assets/svg/$name.svg";

  String get travel => toSVG("travel");
  String get travelExplore => toSVG("travel_explore");
  String get travelWorld => toSVG("travel_world");
  String get welcome => toSVG("welcome");
  String get mobileLogin => toSVG("mobile_login");
  String get forgotPassword => toSVG("forgot_password");
}
