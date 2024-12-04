
import '../models/responses/charge_response.dart';

abstract class TransactionCallBack {
  onTransactionComplete(ChargeResponse? chargeResponse);
}