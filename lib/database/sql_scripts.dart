import 'database_info.dart';

class SqlScript{
  static const String createRestaurantInfoTable = 'CREATE TABLE ${DatabaseInfo.tableRestaurantInfo} '
      '(${DatabaseInfo.columnRestaurantId} INTEGER PRIMARY KEY AUTOINCREMENT,'
      '${DatabaseInfo.columnRestaurantName} TEXT,'
      '${DatabaseInfo.columnRestaurantAddress} TEXT,'
      '${DatabaseInfo.columnRestaurantMobileNumber} TEXT,'
      '${DatabaseInfo.columnRestaurantEmail} TEXT UNIQUE,'
      '${DatabaseInfo.columnRestaurantPassword} TEXT,'
      '${DatabaseInfo.columnImagePath} LONGBLOB);';
}