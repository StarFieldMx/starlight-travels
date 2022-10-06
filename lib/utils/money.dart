const mxConvert = 21;

String getCurrency(double price) {
  final currentPrice = mxConvert * price;
  return 'MXN\$$currentPrice';
}
