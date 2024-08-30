import 'dart:convert';
import 'package:demoz/models/currency_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CurrencyController extends GetxController {
  var currencyStorage = GetStorage();

  String? errorMessage;
  bool isLoading = false;
  bool isError = false;
  bool socketExc = false;

  CurrenciesModel? currencies;

  int selectedCurrencyIndex = 0;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void changeCurrency(int index) {
    selectedCurrencyIndex = index;
    update();
  }

  void setCurrency(Currency currency) {
    currencyStorage.write('currency', currency.toJson());

    update();
  }

  void init() async {
    await fetchData();
  }

  Future<void> fetchData() async {
    isLoading = true;
    update();

    rootBundle
        .loadString('assets/file/currencies.json')
        .then((String jsonString) {
      Map<String, dynamic> jsonData = json.decode(jsonString);
      currencies = CurrenciesModel.fromJson(jsonData);
      currencyStorage.write('availableCurrencies', currencies?.toJson());

      if (currencyStorage.read(('currency')) == null) {
        final contr = Get.find<CurrencyController>().setCurrency;
        for (var curr in currencies!.data!) {
          if (curr.id == 0) {
            contr(curr);
          }
        }
      }
      isLoading = false;
      isError = false;
    }).catchError((e) {
      isError = true;
      errorMessage = e.toString();
    });
    update();
  }
}
