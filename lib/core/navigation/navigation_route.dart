enum NavigationRoute {
  mainRoute("/"),
  detailRoute("/detail"),
  searchRoute("/search"),
  settingRoute("/settings");

  const NavigationRoute(this.name);
  final String name;
}
