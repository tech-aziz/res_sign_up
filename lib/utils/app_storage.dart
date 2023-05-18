import 'package:get_storage/get_storage.dart';

import 'constants.dart';

class AppStorage {
  AppStorage() {
    initStorage();
  }

  void initStorage() async {
    await GetStorage.init();
  }

  void setCompanyLogo(String logo) async {
    await GetStorage().write(Constants.companyLogo, logo);
  }

  String getCompanyLogo() {
    return GetStorage().read(Constants.companyLogo) ?? "";
  }
}
