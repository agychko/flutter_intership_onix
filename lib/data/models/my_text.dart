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
  int select = 0;
  List<Wallet> wallet = [Wallet.euro(),Wallet.usd()];

  void updateText() {
    newText = '$dt';
    setState(() {});


  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        children: <Widget>[
          Text(
            newText,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 24,
            ),
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
          const SizedBox(height: 30),
          Card(
            color: Colors.white,
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                        child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/255px-Flag_of_Europe.svg.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    title: const Text('EUR'),
                    subtitle: const Text('Euro'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black, fontSize: 28),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.euro),
                        hintText: '0.00',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 28),
                        contentPadding: EdgeInsets.all(8.0),
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
                    primary: Colors.white,
                    onPrimary: Colors.grey,
                    elevation: 20,
                    padding: const EdgeInsets.all(5),
                  ),
                  child: const Text('=', style: TextStyle(fontSize: 30)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.grey,
                    elevation: 20,
                    padding: const EdgeInsets.all(12),
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
            color: Colors.white,
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                        child: Image.network(
                          'https://flagcdn.com/w160/us.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    title: const Text('USD'),
                    subtitle: const Text('American Dollar'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black, fontSize: 28),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.attach_money),
                        hintText: '0.00',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 28),
                        contentPadding: EdgeInsets.all(8),
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
