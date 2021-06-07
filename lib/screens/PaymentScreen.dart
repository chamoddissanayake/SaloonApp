import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:saloon_app/widgets/AppBarWidget.dart';
import 'package:saloon_app/widgets/BookingSuccessDialog.dart';
import 'package:saloon_app/widgets/CustomTextWidget.dart';
import 'package:saloon_app/widgets/MainDrawer.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payment';
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child:AppBarWidget() ,
      ),
      drawer: Drawer(
        child: SingleChildScrollView(child: MainDrawer()),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            //   child: Container(
            //       padding: EdgeInsets.all(16),
            //       alignment: Alignment.centerRight,
            //       child: Icon(Icons.close, color: Colors.black)),
            // ),
            SizedBox(height: 20),
            customTextWidget("Payment Gateway",
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24.0),

            SizedBox(height: 20),

            CreditCardWidget(
              cardNumber: "",
              expiryDate: "",
              cardHolderName: "",
              cvvCode: "",
              showBackView: false,
              cardBgColor: Colors.black,
              obscureCardNumber: true,
              obscureCardCvv: true,
              height: 200,
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
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
    );
  }
}
