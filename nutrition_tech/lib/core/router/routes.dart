enum AppRoute {
  fruits('/fruit'),
  sort('/fruit/sort'),
  fruitDetails('/fruit/details'),
  favorites('/favorites'),
  receipts('/receipts'),
  createReceipt('/receipts/create');

  const AppRoute(this.route);
  final String route;
}