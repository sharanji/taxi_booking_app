import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/fitness_app_theme.dart';
import 'package:taxi_app/main.dart';
import 'package:taxi_app/screens/payment/booking_confimed.dart';
import 'package:taxi_app/theme.dart';

// import 'dart:io';
// import 'package:checkout_screen_ui/checkout_page.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top + 10,
          ),
          Center(
            child: Text(
              'Choose a Payment Method',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            height: 65,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '₹ 544.25 ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: kPrimaryColor),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '₹ 600.25 ',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: kSecondaryColor,
                              ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.info_outline,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Promo Code applied !',
                //       style: Theme.of(context).textTheme.caption!.copyWith(
                //             color: Colors.green,
                //           ),
                //     ),
                //     const SizedBox(
                //       width: 15,
                //     ),
                //     Text(
                //       'FSTBK01',
                //       style: Theme.of(context).textTheme.caption!.copyWith(
                //             color: kPrimaryColor,
                //           ),
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Flat 30% off',
                //       style: Theme.of(context).textTheme.caption!.copyWith(
                //           // color: Colors.green,
                //           ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Wallet',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: kPrimaryColor),
            ),
            trailing: const Icon(Icons.arrow_right),
          ),
          ListTile(
            title: Text(
              'Cash after Ride',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: kPrimaryColor),
            ),
            trailing: const Icon(Icons.arrow_right),
          ),
          ListTile(
            title: Text(
              'Online payments',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: kPrimaryColor),
            ),
            trailing: const Icon(Icons.arrow_right),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            // Confrim button
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: kToolbarHeight - 10,
                    padding: const EdgeInsets.symmetric(
                      // vertical: 5,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        FitnessAppTheme.nearlyDarkBlue,
                        HexColor("#6F56E8")
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    ),
                    child: const Icon(
                      FeatherIcons.chevronLeft,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BookingConfrimed(),
                        ),
                      );
                    },
                    child: Container(
                      height: kToolbarHeight - 10,
                      padding: const EdgeInsets.symmetric(
                        // vertical: 5,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              FitnessAppTheme.nearlyDarkBlue,
                              HexColor("#6F56E8")
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Spacer(),
                          Text(
                            'Pay and Confrim',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            FeatherIcons.chevronRight,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}

// class MyDemoPage extends StatelessWidget {
//   const MyDemoPage({Key? key}) : super(key: key);

//   /// REQUIRED: (If you are using native pay option)
//   ///
//   /// A function to handle the native pay button being clicked. This is where
//   /// you would interact with your native pay api
//   Future<void> _nativePayClicked(BuildContext context) async {
//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Native Pay requires setup')));
//   }

//   /// REQUIRED: (If you are using cash pay option)
//   ///
//   /// A function to handle the cash pay button being clicked. This is where
//   /// you would integrate whatever logic is needed for recording a cash transaction
//   Future<void> _cashPayClicked(BuildContext context) async {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text('Cash Pay requires setup')));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final demoOnlyStuff = DemoOnlyStuff();

//     /// RECOMENDED: A global Key to access the credit card pay button options
//     ///
//     /// If you want to interact with the payment button icon, you will need to
//     /// create a global key to pass to the checkout page. Without this key
//     /// the the button will always display 'Pay'. You may view several ways to
//     /// interact with the button elsewhere within this example.
//     final GlobalKey<CardPayButtonState> _payBtnKey =
//         GlobalKey<CardPayButtonState>();

//     /// REQUIRED: A function to handle submission of credit card form
//     ///
//     /// A function is needed to handle your caredit card api calls.
//     ///
//     /// NOTE: This function in our demo example is under the widget's 'build'
//     /// method only becuase it needs access to an instance variable. There is
//     /// no requirement to have this function built here in live code.
//     Future<void> _creditPayClicked(CardFormResults results) async {
//       // you can update the pay button to show somthing is happening
//       _payBtnKey.currentState?.updateStatus(CardPayButtonStatus.processing);

//       // This is where you would implement you Third party credit card
//       // processing api
//       demoOnlyStuff.callTransactionApi(_payBtnKey);

//       // ignore: avoid_print
//       print(results);
//       // WARNING: you should NOT print the above out using live code
//     }

//     /// REQUIRED: A list of what the user is buying
//     ///
//     /// A list of item will be needed to pass into the checkout page. This is a
//     /// simple demo array of [PriceItem]s used to make the demo work. The total
//     /// price is automatically added later.
//     ///
//     /// **NOTE:**
//     /// It is recomended to have no more that 10 items when using the
//     /// current version due to limits of scrollability
//     final List<PriceItem> _priceItems = [
//       PriceItem(name: 'Product A', quantity: 1, totalPriceCents: 5200),
//       PriceItem(name: 'Product B', quantity: 2, totalPriceCents: 8599),
//       PriceItem(name: 'Product C', quantity: 1, totalPriceCents: 2499),
//       PriceItem(name: 'Delivery Charge', quantity: 1, totalPriceCents: 1599),
//     ];

//     /// REQUIRED: A name representing the reciever of the funds from user
//     ///
//     /// Demo vendor name provided here. User's need to know who is recieving
//     /// their money
//     const String _payToName = 'Magic Vendor';

//     /// REQUIRED: (if you are using the native pay options)
//     ///
//     /// Determine whether this platform is iOS. This affects which native pay
//     /// option appears. This is the most basic form of logic needed. You adjust
//     /// this logic based on your app's needs and the platforms you are
//     /// developing for.
//     final _isApple = Platform.isIOS;

//     /// RECOMENDED: widget to display at footer of page
//     ///
//     /// Apple and Google stores typically require a link to privacy and terms when
//     /// your app is collecting and/or transmitting sensitive data. This link is
//     /// expected on the same page as the form that the user is filling out. You
//     /// can make this any type of widget you want, but we have created a prebuilt
//     /// [CheckoutPageFooter] widget that just needs the corresponding links
//     const _footer = CheckoutPageFooter(
//       // These are example url links only. Use your own links in live code
//       privacyLink: 'https://stripe.com/privacy',
//       termsLink: 'https://stripe.com/payment-terms/legal',
//       note: 'Powered By Not_Stripe',
//       noteLink: 'https://stripe.com/',
//     );

//     /// OPTIONAL: A function for the back button
//     ///
//     /// This to be used as needed. If you have another back button built into your
//     /// app, you can leave this function null. If you need a back button function,
//     /// simply add the needed logic here. The minimum required in a simple
//     /// Navigator.of(context).pop() request
//     Function? _onBack = Navigator.of(context).canPop()
//         ? () => Navigator.of(context).pop()
//         : null;

//     // Put it all together
//     return Scaffold(
//       appBar: null,
//       body: CheckoutPage(
//         priceItems: _priceItems,
//         payToName: _payToName,
//         displayNativePay: true,
//         onNativePay: () => _nativePayClicked(context),
//         displayCashPay: true,
//         onCashPay: () => _cashPayClicked(context),
//         isApple: _isApple,
//         onCardPay: (results) => _creditPayClicked(results),
//         onBack: _onBack,
//         payBtnKey: _payBtnKey,
//         displayTestData: true,
//         footer: _footer,
//       ),
//     );
//   }
// }

// /// This class is meant to help separate logic that is only used within this demo
// /// and not expected to resemble logic needed in live code. That said there may
// /// exist some logic that is help to use in live code, such as calls to the
// /// [CardPayButtonState] key to update its displayed color and icon.
// class DemoOnlyStuff {
//   // DEMO ONLY:
//   // this variable is only used for this demo.
//   bool shouldSucceed = true;

//   // DEMO ONLY:
//   // In this demo, this function is used to delay the reseting of the pay
//   // button state in order to allow the user to resubmit the form.
//   // If you API calls a failing a transaction, you may need a similar function
//   // to update the button from CardPayButtonStatus.fail to
//   // CardPayButtonStatus.success. The user will not be able to submit another
//   // payment until the button is reset.
//   Future<void> provideSomeTimeBeforeReset(
//       GlobalKey<CardPayButtonState> _payBtnKey) async {
//     await Future.delayed(const Duration(seconds: 2), () {
//       _payBtnKey.currentState?.updateStatus(CardPayButtonStatus.ready);
//       return;
//     });
//   }

//   Future<void> callTransactionApi(
//       GlobalKey<CardPayButtonState> _payBtnKey) async {
//     await Future.delayed(const Duration(seconds: 2), () {
//       if (shouldSucceed) {
//         _payBtnKey.currentState?.updateStatus(CardPayButtonStatus.success);
//         shouldSucceed = false;
//       } else {
//         _payBtnKey.currentState?.updateStatus(CardPayButtonStatus.fail);
//         shouldSucceed = true;
//       }
//       provideSomeTimeBeforeReset(_payBtnKey);
//       return;
//     });
//   }
// }
