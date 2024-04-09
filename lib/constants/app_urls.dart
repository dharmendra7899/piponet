class AppUrls {
  String get baseUrl => "https://irctc1.p.rapidapi.com/";

  String get classes => "api/v1/getTrainClasses";

  String get searchStations => "api/v1/searchStation";

  String get searchTrains => "api/v1/searchTrain";

  String get liveStatus => "api/v1/liveTrainStatus";

  String get pnrStatus => "api/v3/getPNRStatus";

  String get seatAvailability => "api/v1/checkSeatAvailability";

  String get fareEnquiry => "api/v2/getFare";
}

AppUrls appUrls = AppUrls();
