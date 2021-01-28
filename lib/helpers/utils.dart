class Utils {
  Utils();
  String assetsPath(String name,
      {String suffix: 'png', String type: 'images'}) {
    return 'assets/$type/$name.$suffix';
  }
}
