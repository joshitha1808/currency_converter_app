import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyConverterCupertino extends StatefulWidget {
  const CurrencyConverterCupertino({super.key});

  @override
  State<CurrencyConverterCupertino> createState() =>
      _CurrencyConverterCupertinoState();
}

class _CurrencyConverterCupertinoState
    extends State<CurrencyConverterCupertino> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.blueGrey,
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Currency Converter',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),

      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// RESULT TEXT
              Text(
                result.toString(),
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              /// TEXTFIELD
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoTextField(
                  controller: textEditingController,
                  placeholder: 'please enter the amount in USD',
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.black,
                    ),
                  ),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                ),
              ),

              /// BUTTON
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoButton(
                  color: Colors.black,
                  borderRadius: BorderRadius.zero,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 140,
                    vertical: 15,
                  ),
                  child: const Text(
                    'convert',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      result = double.parse(textEditingController.text) * 81;
                    });
                  },
                ),
              ),

              const SizedBox(height: 20),

              /// NAVIGATION BUTTON
              CupertinoButton(
                child: const Text("Go to Stateless Screen"),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const CurrencyConverterrCupertino(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencyConverterrCupertino extends StatelessWidget {
  const CurrencyConverterrCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    print("rebuilt (cupertino)");

    return CupertinoPageScaffold(
      backgroundColor: Colors.indigo,
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Stateless Widget Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      child: const Center(
        child: Text(
          "This is your Stateless Widget",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
