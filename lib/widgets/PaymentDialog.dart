import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/BookingSuccessDialog.dart';
import 'package:saloon_app/screens/PaymentScreen.dart';
import 'package:sweetalertv2/sweetalertv2.dart';

class PaymentDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: PaymentDialogContent(context),
    );
  }
}

PaymentDialogContent(BuildContext context) {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();


  return SingleChildScrollView(
    child: Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                //   child: Container(
                //       padding: EdgeInsets.all(16),
                //       alignment: Alignment.centerRight,
                //       child: Icon(Icons.close, color: Colors.black)),
                // ),
                SizedBox(height: 10),
                customTextWidget("Payment Gateway",
                    textColor: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),

                CreditCardWidget(
                  cardNumber: "",
                  expiryDate: "",
                  cardHolderName: "",
                  cvvCode: "",
                  showBackView: false,
                  cardBgColor: Colors.black,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  height: 150,
                  textStyle: TextStyle(color: Colors.yellowAccent),
                  width: MediaQuery.of(context).size.width,
                  animationDuration: Duration(milliseconds: 1000),
                ),

                CreditCardForm(
                  formKey: formKey, // Required
                  onCreditCardModelChange: (CreditCardModel data) {
                    print("%%%%");
                    print(data);
                    print("%%%%");
                  }, // Required
                  themeColor: Colors.red,
                  obscureCvv: true,
                  obscureNumber: true,
                  cardNumberDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number',
                    hintText: 'XXXX XXXX XXXX XXXX',
                  ),
                  expiryDateDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Expired Date',
                    hintText: 'XX/XX',
                  ),
                  cvvCodeDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CVV',
                    hintText: 'XXX',
                  ),
                  cardHolderDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Card Holder',
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: customTextWidget("Cancel",
                            textColor: Colors.white, fontSize: 20.0),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        // Navigator.push(context, new MaterialPageRoute(
                        //     builder: (context) => new PaymentScreen())
                        // );

                        //     showSuccessMgs(context);
                        Future.delayed(const Duration(milliseconds: 1), () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => BookingSuccessDialog(),
                          );
                        });




                      },
                      child: Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: new BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: customTextWidget("Pay \$5.20 Now",
                            textColor: Colors.white, fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )),
  );
}

void showSuccessMgs(context) {

  // SweetAlertV2.show(context,
  //     title: "Booking Completed successfully",
  //     subtitle: "Confirmation mail send bccc@gmail.com",
  //     style: SweetAlertV2Style.success);

  // SweetAlertV2.show(context,
  //     subtitle: "Do you want to delete this message",
  //     style: SweetAlertV2Style.confirm,
  //     showCancelButton: true, onPress: (bool isConfirm) {
  //       if(isConfirm){
  //         SweetAlertV2.show(context,subtitle: "Deleting...", style: SweetAlertV2Style.loading);
  //         new Future.delayed(new Duration(seconds: 2),(){
  //           SweetAlertV2.show(context,subtitle: "Success!", style: SweetAlertV2Style.success);
  //         });
  //       }else{
  //         SweetAlertV2.show(context,subtitle: "Canceled!", style: SweetAlertV2Style.error);
  //       }
  //
  //       // return false to keep dialog
  //       return false;
  //     });
}



// https://pub.dev/packages/flutter_credit_card

// https://pub.dev/packages/sweetalertv2/example