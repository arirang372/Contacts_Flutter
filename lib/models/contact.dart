import 'dart:convert';

import 'package:contact_flutter/models/address.dart';
import 'package:contact_flutter/models/phone.dart';

class Contact
{
   String name;
   int id;
   String companyName;
   bool isFavorite;
   String smallImageURL;
   String largeImageURL;
   String emailAddress;
   String birthdate;
   Phone phone;
   Address address;

   Contact({this.name, this.id, this.companyName, this.isFavorite,
            this.smallImageURL, this.largeImageURL, this.emailAddress,
            this.birthdate, this.phone, this.address});

   factory Contact.fromJson(Map<String, dynamic> jsonData)
   {
       return Contact(
               name: jsonData['name'],
               id: int.parse(jsonData['id']),
               companyName: jsonData['companyName'],
               isFavorite: jsonData['isFavorite'] == true,
               smallImageURL: jsonData['smallImageURL'],
               largeImageURL: jsonData['largeImageURL'],
               emailAddress: jsonData['emailAddress'],
               birthdate: jsonData['birthdate'],
               phone: Phone.fromJson(jsonData),
               address: Address.fromJson(jsonData )
       );
   }
}