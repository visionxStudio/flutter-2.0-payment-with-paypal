import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paypal Payment"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Pay Now"),
          onPressed: () async {
            // TODO Handle the payment in here
            var request = BraintreeDropInRequest(
              tokenizationKey: "sandbox_cs3dbjwt_25f49ygkxxbb37gz",
              collectDeviceData: true,
              paypalRequest: BraintreePayPalRequest(
                amount: '10.00', // amount
                displayName: 'Officialvisionx',
              ),
              cardEnabled: true,
            );
            BraintreeDropInResult result = await BraintreeDropIn.start(request);
            if (result != null) {
              print(result.paymentMethodNonce.description);
              print(result.paymentMethodNonce.nonce);
            }
          },
        ),
      ),
    );
  }
}
