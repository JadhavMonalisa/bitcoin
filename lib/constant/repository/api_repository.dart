import 'dart:convert';
import 'package:bitcoin/constant/api_endpoint.dart';
import 'package:bitcoin/constant/provider/api.dart';
import 'package:bitcoin/screens/bitcoin_model.dart';

class ApiRepository {
  final ApiClient apiClient;

  ApiRepository({required this.apiClient});

  Map<String, String> headers = { "Content-Type": "application/json"};

  Future<BitcoinModel> getBitcoinList() async {
    final response = await apiClient.get(
      ApiEndpoint.bitcoinListUrl, headers: headers,
    );
    return BitcoinModel.fromJson(json.decode(response));
  }
}