typedef RouteInfo = ({String path, String name});

class Routes {
  static RouteInfo home = (name: "Home", path: "/");
  static RouteInfo search = (name: "Search", path: "/search");
  static RouteInfo activity = (name: "Activity", path: "/activity");
  static RouteInfo profile = (name: "Profile", path: "/profile");
  static RouteInfo settings = (name: "Settings", path: "/settings");
  static RouteInfo privacy = (name: "privacy", path: "/settings/privacy");
  static RouteInfo signIn = (name: "Sign in", path: "/sign-in");
  static RouteInfo signUp = (name: "Sign up", path: "/create-account");
}
