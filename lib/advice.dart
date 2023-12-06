
class Advice{

  final int _liDARScore;
  final int _luchtFotoScore;
  final int _multiSpectraalScore;

  final String _advice;
  final String _adviceLiDAR;
  final String _adviceLuchtFoto;
  final String _adviceMultiSpec;


  Advice(
      this._liDARScore,
      this._luchtFotoScore,
      this._multiSpectraalScore,
      this._advice,
      this._adviceLiDAR,
      this._adviceLuchtFoto,
      this._adviceMultiSpec);

  String get advice => _advice;

  int get multiSpectraalScore => _multiSpectraalScore;

  int get luchtFotoScore => _luchtFotoScore;

  int get liDARScore => _liDARScore;

  String get adviceMultiSpec => _adviceMultiSpec;

  String get adviceLuchtFoto => _adviceLuchtFoto;

  String get adviceLiDAR => _adviceLiDAR;
}