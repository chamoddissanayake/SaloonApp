class PriceUtils {

  static String getFullPrice(String currentVal) {
    var currentValInDouble = double.parse(currentVal);
    var fullPriceInDouble = currentValInDouble+ 2.00;
    return fullPriceInDouble.toStringAsFixed(2);
  }
}