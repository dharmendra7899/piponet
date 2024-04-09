// To parse this JSON data, do
//
//     final liveStatusDataModal = liveStatusDataModalFromJson(jsonString);

import 'dart:convert';

LiveStatusDataModal liveStatusDataModalFromJson(String str) =>
    LiveStatusDataModal.fromJson(json.decode(str));

String liveStatusDataModalToJson(LiveStatusDataModal data) =>
    json.encode(data.toJson());

class LiveStatusDataModal {
  bool? status;
  String? message;
  int? timestamp;
  Data? data;

  LiveStatusDataModal({
    this.status,
    this.message,
    this.timestamp,
    this.data,
  });

  factory LiveStatusDataModal.fromJson(Map<String, dynamic> json) =>
      LiveStatusDataModal(
        status: json["status"],
        message: json["message"],
        timestamp: json["timestamp"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "timestamp": timestamp,
        "data": data?.toJson(),
      };
}

class Data {
  String? newAlertMsg;
  int? totalDistance;
  bool? atDstn;
  String? trainName;
  String? irTrainName;
  double? spentTime;
  int? statusAsOfMin;
  dynamic smartCityId;
  int? delay;
  int? stoppageNumber;
  String? statusAsOf;
  String? currentStationName;
  String? curStnSta;
  String? etd;
  int? instanceAlert;
  String? seoTrainName;
  String? currentStationCode;
  List<CurrentLocationInfo>? currentLocationInfo;
  bool? atSrc;
  int? platformNumber;
  DateTime? trainStartDate;
  String? source;
  DateTime? updateTime;
  String? aheadDistanceText;
  int? journeyTime;
  int? userId;
  String? destination;
  StateCode? currentStateCode;
  DateTime? notificationDate;
  String? curStnStd;
  List<Station>? previousStations;
  bool? lateUpdate;
  int? aheadDistance;
  bool? isRyEta;
  String? eta;
  String? runDays;
  int? distanceFromSource;
  String? dataFrom;
  String? trainNumber;
  List<Station>? upcomingStations;
  int? avgSpeed;
  int? relatedAlert;
  bool? isRunDay;
  String? status;
  int? siNo;
  int? newAlertId;
  bool? success;
  String? std;
  bool? atSrcDstn;
  int? aDay;

  Data({
    this.newAlertMsg,
    this.totalDistance,
    this.atDstn,
    this.trainName,
    this.irTrainName,
    this.spentTime,
    this.statusAsOfMin,
    this.smartCityId,
    this.delay,
    this.stoppageNumber,
    this.statusAsOf,
    this.currentStationName,
    this.curStnSta,
    this.etd,
    this.instanceAlert,
    this.seoTrainName,
    this.currentStationCode,
    this.currentLocationInfo,
    this.atSrc,
    this.platformNumber,
    this.trainStartDate,
    this.source,
    this.updateTime,
    this.aheadDistanceText,
    this.journeyTime,
    this.userId,
    this.destination,
    this.currentStateCode,
    this.notificationDate,
    this.curStnStd,
    this.previousStations,
    this.lateUpdate,
    this.aheadDistance,
    this.isRyEta,
    this.eta,
    this.runDays,
    this.distanceFromSource,
    this.dataFrom,
    this.trainNumber,
    this.upcomingStations,
    this.avgSpeed,
    this.relatedAlert,
    this.isRunDay,
    this.status,
    this.siNo,
    this.newAlertId,
    this.success,
    this.std,
    this.atSrcDstn,
    this.aDay,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        newAlertMsg: json["new_alert_msg"],
        totalDistance: json["total_distance"],
        atDstn: json["at_dstn"],
        trainName: json["train_name"],
        irTrainName: json["ir_train_name"],
        spentTime: json["spent_time"]?.toDouble(),
        statusAsOfMin: json["status_as_of_min"],
        smartCityId: json["smart_city_id"],
        delay: json["delay"],
        stoppageNumber: json["stoppage_number"],
        statusAsOf: json["status_as_of"],
        currentStationName: json["current_station_name"],
        curStnSta: json["cur_stn_sta"],
        etd: json["etd"],
        instanceAlert: json["instance_alert"],
        seoTrainName: json["seo_train_name"],
        currentStationCode: json["current_station_code"],
        currentLocationInfo: json["current_location_info"] == null
            ? []
            : List<CurrentLocationInfo>.from(json["current_location_info"]!
                .map((x) => CurrentLocationInfo.fromJson(x))),
        atSrc: json["at_src"],
        platformNumber: json["platform_number"],
        trainStartDate: json["train_start_date"] == null
            ? null
            : DateTime.parse(json["train_start_date"]),
        source: json["source"],
        updateTime: json["update_time"] == null
            ? null
            : DateTime.parse(json["update_time"]),
        aheadDistanceText: json["ahead_distance_text"],
        journeyTime: json["journey_time"],
        userId: json["user_id"],
        destination: json["destination"],
        currentStateCode: stateCodeValues.map[json["current_state_code"]]!,
        notificationDate: json["notification_date"] == null
            ? null
            : DateTime.parse(json["notification_date"]),
        curStnStd: json["cur_stn_std"],
        previousStations: json["previous_stations"] == null
            ? []
            : List<Station>.from(
                json["previous_stations"]!.map((x) => Station.fromJson(x))),
        lateUpdate: json["late_update"],
        aheadDistance: json["ahead_distance"],
        isRyEta: json["is_ry_eta"],
        eta: json["eta"],
        runDays: json["run_days"],
        distanceFromSource: json["distance_from_source"],
        dataFrom: json["data_from"],
        trainNumber: json["train_number"],
        upcomingStations: json["upcoming_stations"] == null
            ? []
            : List<Station>.from(
                json["upcoming_stations"]!.map((x) => Station.fromJson(x))),
        avgSpeed: json["avg_speed"],
        relatedAlert: json["related_alert"],
        isRunDay: json["is_run_day"],
        status: json["status"],
        siNo: json["si_no"],
        newAlertId: json["new_alert_id"],
        success: json["success"],
        std: json["std"],
        atSrcDstn: json["at_src_dstn"],
        aDay: json["a_day"],
      );

  Map<String, dynamic> toJson() => {
        "new_alert_msg": newAlertMsg,
        "total_distance": totalDistance,
        "at_dstn": atDstn,
        "train_name": trainName,
        "ir_train_name": irTrainName,
        "spent_time": spentTime,
        "status_as_of_min": statusAsOfMin,
        "smart_city_id": smartCityId,
        "delay": delay,
        "stoppage_number": stoppageNumber,
        "status_as_of": statusAsOf,
        "current_station_name": currentStationName,
        "cur_stn_sta": curStnSta,
        "etd": etd,
        "instance_alert": instanceAlert,
        "seo_train_name": seoTrainName,
        "current_station_code": currentStationCode,
        "current_location_info": currentLocationInfo == null
            ? []
            : List<dynamic>.from(currentLocationInfo!.map((x) => x.toJson())),
        "at_src": atSrc,
        "platform_number": platformNumber,
        "train_start_date":
            "${trainStartDate!.year.toString().padLeft(4, '0')}-${trainStartDate!.month.toString().padLeft(2, '0')}-${trainStartDate!.day.toString().padLeft(2, '0')}",
        "source": source,
        "update_time": updateTime?.toIso8601String(),
        "ahead_distance_text": aheadDistanceText,
        "journey_time": journeyTime,
        "user_id": userId,
        "destination": destination,
        "current_state_code": stateCodeValues.reverse[currentStateCode],
        "notification_date":
            "${notificationDate!.year.toString().padLeft(4, '0')}-${notificationDate!.month.toString().padLeft(2, '0')}-${notificationDate!.day.toString().padLeft(2, '0')}",
        "cur_stn_std": curStnStd,
        "previous_stations": previousStations == null
            ? []
            : List<dynamic>.from(previousStations!.map((x) => x.toJson())),
        "late_update": lateUpdate,
        "ahead_distance": aheadDistance,
        "is_ry_eta": isRyEta,
        "eta": eta,
        "run_days": runDays,
        "distance_from_source": distanceFromSource,
        "data_from": dataFrom,
        "train_number": trainNumber,
        "upcoming_stations": upcomingStations == null
            ? []
            : List<dynamic>.from(upcomingStations!.map((x) => x.toJson())),
        "avg_speed": avgSpeed,
        "related_alert": relatedAlert,
        "is_run_day": isRunDay,
        "status": status,
        "si_no": siNo,
        "new_alert_id": newAlertId,
        "success": success,
        "std": std,
        "at_src_dstn": atSrcDstn,
        "a_day": aDay,
      };
}

class CurrentLocationInfo {
  int? type;
  String? readableMessage;
  String? message;
  String? label;
  String? imgUrl;
  String? hint;
  String? deeplink;

  CurrentLocationInfo({
    this.type,
    this.readableMessage,
    this.message,
    this.label,
    this.imgUrl,
    this.hint,
    this.deeplink,
  });

  factory CurrentLocationInfo.fromJson(Map<String, dynamic> json) =>
      CurrentLocationInfo(
        type: json["type"],
        readableMessage: json["readable_message"],
        message: json["message"],
        label: json["label"],
        imgUrl: json["img_url"],
        hint: json["hint"],
        deeplink: json["deeplink"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "readable_message": readableMessage,
        "message": message,
        "label": label,
        "img_url": imgUrl,
        "hint": hint,
        "deeplink": deeplink,
      };
}

enum StateCode { BR, GJ, MH, MP, RJ, UP }

final stateCodeValues = EnumValues({
  "BR": StateCode.BR,
  "GJ": StateCode.GJ,
  "MH": StateCode.MH,
  "MP": StateCode.MP,
  "RJ": StateCode.RJ,
  "UP": StateCode.UP
});

class Station {
  int? stoppageNumber;
  String? std;
  String? stationName;
  double? stationLng;
  double? stationLat;
  String? stationCode;
  StateCode? stateCode;
  String? sta;
  dynamic smartCityId;
  int? siNo;
  int? platformNumber;
  List<NonStop>? nonStops;
  int? halt;
  String? etd;
  String? eta;
  int? distanceFromSource;
  int? arrivalDelay;
  int? aDay;
  int? onTimeRating;
  bool? foodAvailable;
  int? etaAMin;
  String? distanceFromCurrentStationTxt;
  int? distanceFromCurrentStation;
  int? day;

  Station({
    this.stoppageNumber,
    this.std,
    this.stationName,
    this.stationLng,
    this.stationLat,
    this.stationCode,
    this.stateCode,
    this.sta,
    this.smartCityId,
    this.siNo,
    this.platformNumber,
    this.nonStops,
    this.halt,
    this.etd,
    this.eta,
    this.distanceFromSource,
    this.arrivalDelay,
    this.aDay,
    this.onTimeRating,
    this.foodAvailable,
    this.etaAMin,
    this.distanceFromCurrentStationTxt,
    this.distanceFromCurrentStation,
    this.day,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        stoppageNumber: json["stoppage_number"],
        std: json["std"],
        stationName: json["station_name"],
        stationLng: json["station_lng"]?.toDouble(),
        stationLat: json["station_lat"]?.toDouble(),
        stationCode: json["station_code"],
        stateCode: stateCodeValues.map[json["state_code"]]!,
        sta: json["sta"],
        smartCityId: json["smart_city_id"],
        siNo: json["si_no"],
        platformNumber: json["platform_number"],
        nonStops: json["non_stops"] == null
            ? []
            : List<NonStop>.from(
                json["non_stops"]!.map((x) => NonStop.fromJson(x))),
        halt: json["halt"],
        etd: json["etd"],
        eta: json["eta"],
        distanceFromSource: json["distance_from_source"],
        arrivalDelay: json["arrival_delay"],
        aDay: json["a_day"],
        onTimeRating: json["on_time_rating"],
        foodAvailable: json["food_available"],
        etaAMin: json["eta_a_min"],
        distanceFromCurrentStationTxt:
            json["distance_from_current_station_txt"],
        distanceFromCurrentStation: json["distance_from_current_station"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "stoppage_number": stoppageNumber,
        "std": std,
        "station_name": stationName,
        "station_lng": stationLng,
        "station_lat": stationLat,
        "station_code": stationCode,
        "state_code": stateCodeValues.reverse[stateCode],
        "sta": sta,
        "smart_city_id": smartCityId,
        "si_no": siNo,
        "platform_number": platformNumber,
        "non_stops": nonStops == null
            ? []
            : List<dynamic>.from(nonStops!.map((x) => x.toJson())),
        "halt": halt,
        "etd": etd,
        "eta": eta,
        "distance_from_source": distanceFromSource,
        "arrival_delay": arrivalDelay,
        "a_day": aDay,
        "on_time_rating": onTimeRating,
        "food_available": foodAvailable,
        "eta_a_min": etaAMin,
        "distance_from_current_station_txt": distanceFromCurrentStationTxt,
        "distance_from_current_station": distanceFromCurrentStation,
        "day": day,
      };
}

class NonStop {
  String? std;
  String? stationName;
  String? stationCode;
  StateCode? stateCode;
  String? sta;
  int? siNo;
  int? distanceFromSource;

  NonStop({
    this.std,
    this.stationName,
    this.stationCode,
    this.stateCode,
    this.sta,
    this.siNo,
    this.distanceFromSource,
  });

  factory NonStop.fromJson(Map<String, dynamic> json) => NonStop(
        std: json["std"],
        stationName: json["station_name"],
        stationCode: json["station_code"],
        stateCode: stateCodeValues.map[json["state_code"]]!,
        sta: json["sta"],
        siNo: json["si_no"],
        distanceFromSource: json["distance_from_source"],
      );

  Map<String, dynamic> toJson() => {
        "std": std,
        "station_name": stationName,
        "station_code": stationCode,
        "state_code": stateCodeValues.reverse[stateCode],
        "sta": sta,
        "si_no": siNo,
        "distance_from_source": distanceFromSource,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
