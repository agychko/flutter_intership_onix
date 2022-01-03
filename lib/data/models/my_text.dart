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
      padding: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Text(
            newText,
            // style: const TextStyle(
            //   color: Colors.blue,
            //   fontSize: 24,
            // ),
          ),
          const SizedBox(height: 20),
          TextField(
            style: const TextStyle(color: Colors.black, fontSize: 20),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white12,
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: Colors.grey,
              suffixIcon: const Icon(Icons.mic),
              suffixIconColor: Colors.grey,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
              hintText: 'Search',
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
              contentPadding: const EdgeInsets.all(8.0),
            ),
          ),
          const SizedBox(height: 40),
          Card(
            // color: Colors.white,
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 30, 5, 30),
              child: Column(
                children: [
                  ListTile(
                    leading: SizedBox(
                      height: 70, width: 70,
                      child: Card(
                        elevation: 18,
                        clipBehavior: Clip.antiAlias,
                        shape:const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: wallet[one].flag
                      ),
                    ),
                    title: Text(wallet[one].symbol),
                    subtitle: Text(wallet[one].name),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                     child: TextField(
                       keyboardType: TextInputType.number,
                       style: const TextStyle(color: Colors.black, fontSize: 28),
                       decoration: InputDecoration(
                         suffixIcon: wallet[one].icon,
                         hintText: '0.00',
                         hintStyle: const TextStyle(color: Colors.grey, fontSize: 28),
                         contentPadding: const EdgeInsets.all(8.0),
                       ),
                     ),
                   ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.white,
                    // onPrimary: Colors.grey,
                    // elevation: 20,
                    padding: const EdgeInsets.all(8),
                  ),
                  child: const Text('=', style: TextStyle(fontSize: 30)),
                ),
                ElevatedButton(
                  onPressed: () {switchCurrency();},
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.white,
                    // onPrimary: Colors.grey,
                    // elevation: 20,
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
            // color: Colors.white,
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListTile(horizontalTitleGap: 20,
                    leading: SizedBox(
                      height: 70, width: 70,
                      child: Card(
                        elevation: 18,
                        clipBehavior: Clip.antiAlias,
                        shape:const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: wallet[two].flag
                      ),
                    ),
                    title:  Text(wallet[two].symbol),
                    subtitle: Text(wallet[two].name),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                     child: TextField(
                       keyboardType: TextInputType.number,
                       style: const TextStyle(color: Colors.black, fontSize: 28),
                       decoration: InputDecoration(
                         suffixIcon: wallet[two].icon,
                         hintText: '0.00',
                         hintStyle: const TextStyle(color: Colors.grey, fontSize: 28),
                         contentPadding: const EdgeInsets.all(8),
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
