import 'package:bitcoin/constant/provider/api.dart';
import 'package:bitcoin/constant/repository/api_repository.dart';
import 'package:bitcoin/screens/bitcoin_controller.dart';
import 'package:get/get.dart';

class BitcoinBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BitcoinController(repository: ApiRepository(apiClient: ApiClient())));
  }
}