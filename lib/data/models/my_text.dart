import 'package:first/data/models/wallet.dart';
import 'package:flutter/material.dart';

class MyText extends StatefulWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  State<MyText> createState() => MyTextState();
}

class MyTextState extends State<MyText> {
  String newText = 'Hello!';
  DateTime dt = DateTime.now();
  int one = 0;
  int two = 1;
  List<Wallet> wallet = [Wallet.euro(),Wallet.usd()];

  void updateText() {
    newText = '$dt';
    setState(() {});
  }
   switchCurrency (){
    (one==0)? one=1:one=0;
    (two==0)? two=1:two=0;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 40),
          Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 30, 5, 30),
              child: Column(
                children: [
                  ListTile(
                    leading: SizedBox(
                      height: 70, width: 70,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: wallet[one].flag
                      ),
                    ),
                    title: Text(wallet[one].symbol),
                    subtitle: Text(wallet[one].name),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(16, 0, 5, 10),
                     child: TextField(
                       keyboardType: TextInputType.number,
                       style: Theme.of(context).textTheme.headline5,
                       decoration: InputDecoration(
                         suffixIcon: wallet[one].icon,
                         hintText: '0.00',
                         hintStyle: Theme.of(context).textTheme.headline5,
                         ),
                     ),
                   ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                  ),
                  child: const Text('=',
                      style: TextStyle(fontSize: 30)
                  ),
                ),
                ElevatedButton(
                  onPressed: () {switchCurrency();},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.import_export),
                      Text('Switch Currencies'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListTile(horizontalTitleGap: 20,
                    leading: SizedBox(
                      height: 70, width: 70,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: wallet[two].flag
                      ),
                    ),
                    title:  Text(wallet[two].symbol),
                    subtitle: Text(wallet[two].name),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(16, 0, 5, 10),
                     child: TextField(
                       keyboardType: TextInputType.number,
                       style: Theme.of(context).textTheme.headline5,
                       decoration: InputDecoration(
                         suffixIcon: wallet[two].icon,
                         hintText: '0.00',
                         hintStyle: Theme.of(context).textTheme.headline5,
                       ),
                     ),
                   ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
