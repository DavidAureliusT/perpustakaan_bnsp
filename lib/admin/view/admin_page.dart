import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => AdminPage());
  }

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Admin Page"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "logout",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            "Form Borrowing",
            style: Theme.of(context).textTheme.headline3,
          ),
          // DropdownButton(

          //     // Initial Value
          //     value: userDropdownValue,

          //     // Down Arrow Icon
          //     icon: const Icon(Icons.keyboard_arrow_down),

          //     // Array list of items
          //     items: items.map((String items) {
          //       return DropdownMenuItem(
          //         value: items,
          //         child: Text(items),
          //       );
          //     }).toList(),
          //     // After selecting the desired option,it will
          //     // change button value to selected value
          //     onChanged: (String? newValue) {
          //       setState(() {
          //         dropdownvalue = newValue!;
          //       });
          //     },
          //   ),
        ],
      ),
    );
  }
}
