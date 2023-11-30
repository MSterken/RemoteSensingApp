class MapChecker{

  Map<String,bool> _mapChecks = {};
  bool drone = true;
  bool AHN = false;
  bool oud = false;
  bool ondergrond = false;
  bool ondergrond2 =false;

  MapChecker(){
    _mapChecks["https://map.godrone.nl/#loc=52.1553994,5.3574833,12.9"] = drone;
    _mapChecks["https://ahn.arcgisonline.nl/ahnviewer/"] = AHN;
    _mapChecks["https://www.topotijdreis.nl/kaart/1938/@186007,319659,10.97"] = oud;
    _mapChecks["https://www.dinoloket.nl/ondergrondgegevens"] = ondergrond;
    _mapChecks["https://www.dinoloket.nl/ondergrondmodellen/kaart"] = ondergrond2;
  }

  Map<String, bool> get mapChecks => _mapChecks;

  void changeTrue(String url){
    mapChecks.forEach((key, value) {
      if (key == url){
        mapChecks[key] = true;
      } else {
        mapChecks[key] = false;
      }
    }
    );
    print(mapChecks.toString() );
  }
}