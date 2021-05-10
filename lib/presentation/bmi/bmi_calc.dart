import 'package:flutter/material.dart';
import 'package:udalogin/presentation/auth/login.dart';

class BmiCalc extends StatefulWidget {
  @override
  _BmiCalcState createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _result = 0;
  double _height = 0, _weight = 0;
  String _category = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: [
          InkWell(
            onTap: () {
              // Navigator.of(context).pushNamed('/login');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PageLogin()));
            },
            child: Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Result',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _result == 0 ? "0" : "${_result.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                _category == "" ? "" : '($_category)',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              Container(
                width: size.width * 0.9,
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text('Tinggi Badan (Cm)'),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: _heightController,
                        decoration: InputDecoration(
                          hintText: 'tinggi badan (cm)',
                          hintStyle:
                              TextStyle(color: Color(0xFFACACAC), fontSize: 14),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade100),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    text('Berat Badan (Kg)'),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: _weightController,
                        decoration: InputDecoration(
                          hintText: 'berat badan (kg)',
                          hintStyle:
                              TextStyle(color: Color(0xFFACACAC), fontSize: 14),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade100),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          calculateBMI();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Colors.amber.shade400,
                                  Colors.orange
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Calculate",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget text(String text) {
    return Text(text, style: TextStyle(fontWeight: FontWeight.bold));
  }

  void calculateBMI() {
    _height = double.parse(_heightController.text) / 100;
    _weight = double.parse(_weightController.text);

    double _heightSquare = _height * _height;
    double _resultBMI = _weight / _heightSquare;

    setState(() {
      _result = _resultBMI;
      category();
    });
  }

  void category() {
    String _ket;
    if (_result <= 17.0) {
      _ket = "Kurus, kurang dari 17.0";
    } else if (_result <= 18.5) {
      _ket = 'Kurus, Kurang Ideal';
    } else if (_result <= 25.0) {
      _ket = 'Normal';
    } else if (_result <= 29) {
      _ket = 'Gemuk';
    } else {
      _ket = 'Obesitas';
    }

    setState(() {
      _category = _ket;
    });
  }
}
