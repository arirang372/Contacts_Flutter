import 'package:contact_flutter/ui/contact_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MainActivity());

class MainActivity extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
      return new MaterialApp(
                title: 'Contacts',
                theme: new ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: new ContactListActivity(title: 'Contacts'),
              );
    }
}

