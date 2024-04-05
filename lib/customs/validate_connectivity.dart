import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../providers/connectivity_provider.dart';
import 'loading.dart';
import 'toast_message.dart';

validateConnectivity(
    {required context,
    required dynamic provider,
    bool? isLoader = false,
    bool? showMessage = true}) {
  fToast = FToast();
  fToast.init(context);
  var checkInternet = Provider.of<CheckInternet>(context, listen: false);
  checkInternet.checkConnectivity().then((value) {
    if (value) {
      isLoader == true
          ? loading(context, () {
              provider();
            })
          : provider();
    } else {
      if (showMessage == true) {
        showToast("No internet connection.", time: 2);
      }
    }
  });
}
