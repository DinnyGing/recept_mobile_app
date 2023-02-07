import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recept/screens/search_screen.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key, required this.title});

  final String title;

  @override
  State<Calculate> createState() => _CalculateState();
}

enum Gender {male, female}

class _CalculateState extends State<Calculate> {
  final _textControllerHeight = TextEditingController();
  final _textControllerWeight = TextEditingController();

  String _resultMessage = "";
  int _age = 18;
  String _gender = "male";
  double _height = 0;
  double _weight = 0;
  double _res = 2250;

  Gender? _genderChoose = Gender.male;


  @override
  void _getBack() async{
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => SearchScreen(targetCalories: _res),
    ));
  }


  void _calculate() {
    setState(() {
      _res = 10 * _weight + 6.25 * _height - 5 * _age;
      if(_gender == 'male') {
        _res = (_res + 5);
        _resultMessage = "Result: " + _res.toString();
      }
      else if(_gender == 'female') {
        _res = (_res -161);
        _resultMessage = "Result: " + _res.toString();
      }
      else{
        _resultMessage = "Mistake: Gender isn't correct";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Choose your gender:',
            ),
            Padding(padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              value: Gender.male,
                              groupValue: _genderChoose,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _gender = "male";
                                  _genderChoose = value;
                                });
                              },
                            ),
                            Expanded(
                              child: Text('male'),
                            )
                          ],
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              value: Gender.female,
                              groupValue: _genderChoose,
                              onChanged: (Gender? value) {
                                setState(() {
                                  _gender = "female";
                                  _genderChoose = value;
                                });
                              },
                            ),
                            Expanded(child: Text('female'))
                          ],
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Text(
              'Choose your age:',
            ),
            RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                          text: _age.toString(),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ]
                )
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbColor: Theme.of(context).primaryColor,
                inactiveTrackColor: Colors.lightBlue[100],
                trackHeight: 6,
              ),
              child: Slider(
                min: 0,
                max: 100,
                value: _age.toDouble(),
                onChanged: (value) => setState(() {
                  _age = value.round().toInt();
                }),
              ),
            ),
            const Text(
              'Input your height (cm):',
            ),
            Padding(padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: _textControllerHeight,
                onChanged: (text){
                  _height = double.parse(text);
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9\.]'))
                ],
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              'Input your weight (kilo):',
            ),
            Padding(padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: _textControllerWeight,
                onChanged: (text){
                  _weight = double.parse(text);
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9\.]'))
                ],
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculate'),
            ),
            Text(
                "$_resultMessage"
            ),
            TextButton(
                onPressed: _getBack,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  primary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                        color: Colors.grey,
                        width: 1,
                        style: BorderStyle.solid
                    ),
                  ),
                ),
                child: Text(
                    "Get back"
                )
            ),
          ],
        ),
      ),
    );
  }
}