import 'package:bitcoin/constant/provider/custom_exception.dart';
import 'package:bitcoin/constant/repository/api_repository.dart';
import 'package:bitcoin/screens/bitcoin_model.dart';
import 'package:bitcoin/utils/utils.dart';
import 'package:get/get.dart';

class BitcoinController extends GetxController {

  final ApiRepository repository;

  // ignore: unnecessary_null_comparison
  BitcoinController({required this.repository}) : assert(repository != null);

  List<USD> bitcoinList = [];
  Map demoList = {};
  bool isLoading = true;
  int rateIndex = 0;

  @override
  void onInit() {
    super.onInit();
    callBitcoinList();
  }

  ///bitcoin api list
  callBitcoinList() async{
    bitcoinList.clear();

    try {
      BitcoinModel? response = (await repository.getBitcoinList());

      bitcoinList.add(USD(
        rate: response.bpi!.uSD!.rate,
        code: response.bpi!.uSD!.code,
        description: response.bpi!.uSD!.description,
        rateFloat: response.bpi!.uSD!.rateFloat,
        symbol: response.bpi!.uSD!.symbol,
      ));

      bitcoinList.add(USD(
        rate: response.bpi!.gBP!.rate,
        code: response.bpi!.gBP!.code,
        description: response.bpi!.gBP!.description,
        rateFloat: response.bpi!.gBP!.rateFloat,
        symbol: response.bpi!.gBP!.symbol,
      ));

      bitcoinList.add(USD(
        rate: response.bpi!.eUR!.rate,
        code: response.bpi!.eUR!.code,
        description: response.bpi!.eUR!.description,
        rateFloat: response.bpi!.eUR!.rateFloat,
        symbol: response.bpi!.eUR!.symbol,
      ));

      isLoading = false;
      update();
    } on CustomException catch (e) {
      isLoading = false;
      Utils.showErrorSnackBar(e.getMsg().toString());
      update();
    } catch (error) {
      isLoading = false;
      Utils.showErrorSnackBar(error.toString());
      update();
    }
    update();
  }

  ///on currency code change
  onScrollChange(int changeIndex){
    rateIndex = changeIndex;
    update();
  }

}