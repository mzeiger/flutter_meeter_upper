import 'package:flutter/material.dart';

Widget cardTemplate(post) {
  return Card(
    color: const Color(0xFFd1d1d1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
    child: Container(
      padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            " ${post['lastname']}, ${post['firstname']}",
            style: const TextStyle(color: Colors.blue, fontSize: 30,),
          ),
          Text(
            "  Spouse: ${post['cb_spousename']}",
            style: const TextStyle(color: Colors.green, fontSize: 20),
          ),
          Text(
            "  ${post['email']}",
            style: const TextStyle(color: Colors.cyan, fontSize: 20),
          ),
          Text(
            "  ${post['cb_address']}",
            style: const TextStyle(color: Colors.blue, fontSize: 20),
          ),
          Text(
            "  ${post['cb_city']}, ${post['cb_state']} ${post['cb_zipcode']}",
            style: const TextStyle(color: Colors.blue, fontSize: 20),
          ),
          Text(
            "  Home Phone:  ${post['cb_homephone']}",
            style: const TextStyle(color: Colors.blue, fontSize: 20),
          ),
          Text(
            "  Cell Phone: ${post['cb_mobilephone']}",
            style: const TextStyle(color: Colors.blue, fontSize: 20),
          ),
        ],
      ),
    ),
  );
}
