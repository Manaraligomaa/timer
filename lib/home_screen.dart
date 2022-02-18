import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var timer;
  @override
  void initState(){
    super.initState();
timer =Provider.of<TimerProvider>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: homeScreenBody(),
    );
  }
 Widget homeScreenBody(){
return Container(
  child: Consumer<TimerProvider> (
    builder:(context,timeprovider,Widget){
      return Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              ' ${timer.hour}: ' + '${timer.minute} : ' + '${timer.second}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,

              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (timer.start)?
              ElevatedButton(
                onPressed:timer.startTimer ,
                child: Text('start'),
              ):ElevatedButton(onPressed: null, child: Text('start'),),
              (timer.stop)?
              ElevatedButton(
                onPressed: timer.stopTimer,
                child: Text('stop'),
              ):ElevatedButton(onPressed: null, child: Text('stop'),),
              (timer.continu)?
              ElevatedButton(
                onPressed: timer.continuTimer,
                child: Text('continue'),
              ):ElevatedButton(onPressed: null, child: Text('continu'),),
            ],
          )
        ],
      );

    },
  ),
 );
 }
}
