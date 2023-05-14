import 'package:get_storage/get_storage.dart';

import 'constants.dart';

class AppStorage{

  void setCompanyLogo(String logo) async {
    await GetStorage().write(Constants.companyLogo, logo);
  }



}