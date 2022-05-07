import 'package:app_alcool_ou_gasolina/model/homeModel.dart';

class HomeController {
  String calcular(String controllerAlcool, String controllerGasolina) {
    final modelHome = HomeModel(controllerAlcool, controllerGasolina);
    double? precoAlcool = double.tryParse(modelHome.alcool);
    double? precoGasolina = double.tryParse(modelHome.gasolina);

    if (precoAlcool == null || precoGasolina == null) {
      return 'Entrada inválida. Por favor, informe números válidos';
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        return 'Abasteça com Gasolina';
      } else {
        return 'Abasteça com Álcool';
      }
    }
  }
}
