
import 'package:flutter/material.dart';


class task extends StatefulWidget {
  @override
  _taskState createState() => _taskState();
}

class _taskState extends State<task> {
  final TextEditingController _inputController = TextEditingController();

  void showAnswer(String answer) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Answer"),
        content: SingleChildScrollView(child: Text(answer)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }

  String solveQuestion(int index) {
    switch (index) {
      case 1:
      // GST Calculation
        int nights = 3;
        double rate = 4000;
        double total = nights * rate;
        double gstRate = 0.12;
        double gst = total * gstRate;
        double finalAmount = total + gst;
        return "Room rate: ₹4000 x 3 nights = ₹$total\nGST @12%: ₹$gst\nTotal Payable: ₹${finalAmount.toStringAsFixed(2)}";

      case 2:
      // Fibonacci Series
        int n = int.tryParse(_inputController.text) ?? 10;
        List<int> fib = [0, 1];
        for (int i = 2; i < n; i++) {
          fib.add(fib[i - 1] + fib[i - 2]);
        }
        return "First $n Fibonacci numbers:\n${fib.take(n).join(', ')}";

      case 3:
      // Grading System
        int marks = int.tryParse(_inputController.text) ?? 0;
        String grade;
        if (marks >= 90) grade = "A";
        else if (marks >= 80) grade = "B";
        else if (marks >= 70) grade = "C";
        else if (marks >= 60) grade = "D";
        else grade = "Fail";
        return "Marks: $marks\nGrade: $grade";

      case 4:
      // Factor Finder
        String result = "";
        for (int i = 1; i <= 20; i++) {
          List<int> factors = [];
          for (int j = 1; j <= i; j++) {
            if (i % j == 0) factors.add(j);
          }
          result += "$i → ${factors.join(', ')}\n";
        }
        return result;

      case 5:
      // Leap Year Checker
        String result = "";
        for (int year = 2000; year <= 2050; year++) {
          if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
            result += "$year → Leap Year\n";
          } else {
            result += "$year\n";
          }
        }
        return result;

      case 6:
      // Simple Interest
        double P = 5000, R = 5, T = 3;
        double SI = (P * R * T) / 100;
        return "Principal: ₹$P\nRate: $R%\nTime: $T years\nSimple Interest: ₹$SI";

      case 7:
      // Surface Area of Cylinder
        double r = 5, h = 10; // Example values
        double area = 2 * 3.1416 * r * (r + h);
        return "Radius: $r\nHeight: $h\nSurface Area: ${area.toStringAsFixed(2)}";

      case 8:
      // Celsius to Fahrenheit
        double celsius = double.tryParse(_inputController.text) ?? 0;
        double fahrenheit = (celsius * 9 / 5) + 32;
        return "$celsius°C = ${fahrenheit.toStringAsFixed(2)}°F";

      case 9:
      // Discount Calculation
        double price = double.tryParse(_inputController.text) ?? 0;
        double discountRate = 0;
        if (price < 10000) discountRate = 0.05;
        else if (price <= 30000) discountRate = 0.10;
        else if (price <= 60000) discountRate = 0.15;
        else discountRate = 0.20;
        double discount = price * discountRate;
        double finalPrice = price - discount;
        return "Original Price: ₹$price\nDiscount: ₹$discount\nFinal Price: ₹${finalPrice.toStringAsFixed(2)}";

      case 10:
      // Electricity Bill
        Map<String, int> unitsUsed = {"Priya": 250, "Ravi": 320};
        String result = "";

        unitsUsed.forEach((name, units) {
          double bill = 0;
          int remaining = units;

          if (remaining > 300) {
            bill += (remaining - 300) * 10;
            remaining = 300;
          }
          if (remaining > 200) {
            bill += (remaining - 200) * 7;
            remaining = 200;
          }
          if (remaining > 100) {
            bill += (remaining - 100) * 5;
            remaining = 100;
          }
          bill += remaining * 3;

          result += "$name consumed $units units\nBill: ₹${bill.toStringAsFixed(2)}\n\n";
        });

        return result;

      default:
        return "Invalid question number.";
    }
  }

  final List<Map<String, dynamic>> questions = [
    {'title': '1. GST Calculation', 'index': 1},
    {'title': '2. Fibonacci Series', 'index': 2},
    {'title': '3. Grading System', 'index': 3},
    {'title': '4. Factor Finder', 'index': 4},
    {'title': '5. Leap Year Checker', 'index': 5},
    {'title': '6. Simple Interest', 'index': 6},
    {'title': '7. Surface Area of Cylinder', 'index': 7},
    {'title': '8. Temperature Converter', 'index': 8},
    {'title': '9. Discount Calculation', 'index': 9},
    {'title': '10. Electricity Bill Calculator', 'index': 10},
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question"),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: _inputController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter',
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: questions.map((q) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: ElevatedButton(
                      onPressed: () {
                        String answer = solveQuestion(q['index']);
                        showAnswer(answer);
                      },
                      child: Text(q['title'],style: TextStyle(color: Colors.black),),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





