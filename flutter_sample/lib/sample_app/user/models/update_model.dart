class UpdateModel {
  String appIcon;
  String appName;
  String appSize;
  String appDate;
  String appDescription;
  String appVersion;
  bool isFold = true;
  bool showMoreButton = false;
  UpdateModel({this.appIcon, this.appName, this.appSize, this.appDate, this.appDescription, this.appVersion});
  
  UpdateModel.fromMap(Map<String, dynamic> map) {
    appIcon = map['appIcon'];
    appName = map['appName'];
    appSize = map['appSize'];
    appDate = map['appDate'];
    appDescription = map['appDescription'];
    appVersion = map['appVersion'];
  }
}