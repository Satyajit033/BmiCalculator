import 'package:bmi_calculator/style.dart';
import 'package:flutter/material.dart';

class BMICalculatorHome extends StatefulWidget {
  const BMICalculatorHome({super.key});

  @override
  _BMICalculatorHomeState createState() => _BMICalculatorHomeState();
}

class _BMICalculatorHomeState extends State<BMICalculatorHome> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String result = '';
  String advice = '';

  void calculateBMI() {
    final double weight = double.tryParse(weightController.text) ?? 0;
    final double height = double.tryParse(heightController.text) ?? 0;
    final double feetHeight = height * 0.3048;

    if (weight > 0 && feetHeight > 0) {
      final double bmi = weight / (feetHeight * feetHeight);
      setState(() {
        result = 'Your BMI is: ${bmi.toStringAsFixed(2)}';
      });
      if (bmi < 18.5) {
        advice = "Underweight";
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        advice = "Normal";
      } else if (bmi >= 25.0 && bmi <= 29.9) {
        advice = "Overweight";
      } else if (bmi >= 30.0) {
        advice = "Obesity";
      }
    } else {
      setState(() {
        result = 'Please enter valid values.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/download.jpg',
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Image.asset(
                        'assets/images/bmi.png',
                        alignment: Alignment.center,
                        width: 90,
                        height: 90,
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      TextFormField(
                        cursorColor: Colors.blueGrey,
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        decoration: AppInputDecoration('Weight (kg)'),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your weight in KG';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        cursorColor: Colors.blueGrey,
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        decoration: AppInputDecoration('Height (feet)'),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Enter your height in feet';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          calculateBMI();
                        },
                        style: AppButtonStyle(),
                        child: SuccessButtonChild(const Text(
                          "Calculate BMI",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        result,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        advice,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
