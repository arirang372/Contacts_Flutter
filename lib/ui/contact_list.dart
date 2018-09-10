import 'dart:async';
import 'package:contact_flutter/models/contact.dart';
import 'package:contact_flutter/ui/contact_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ContactListActivity extends StatelessWidget
{
  final String title;

  ContactListActivity({Key key, this.title}): super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body:Container(
          child: ContactList(),
        )
    );
  }
}


class ContactList extends StatefulWidget
{
  ContactList({Key key}):super(key:key);

  @override
  ContactListState createState() => ContactListState();

}

class ContactListState extends State<ContactList>
{
    List<Contact> contacts = [];
    List<Contact> favoriteContacts = [];
    List<Contact> otherContacts = [];

    @override
    void initState()
    {
      super.initState();
      loadData();
    }

    Future<List<Contact>> loadData() async
    {
      String url = "https://s3.amazonaws.com/technical-challenge/v3/contacts.json";
      http.Response response = await http.get(url);
      if(response.statusCode == 200)
      {

        List<dynamic> jsonArray = json.decode(response.body);
        List<Map<String, dynamic>> maps = new List<Map<String, dynamic>>();
        for(dynamic v in jsonArray)
        {
          maps.add(v);
        }
        for(var p in maps)
        {
          contacts.add(Contact.fromJson(p));
        }

        setState(() {
          favoriteContacts = contacts.where( (c)=> c.isFavorite).toList();
          otherContacts = contacts.where( (c)=> !c.isFavorite).toList();
        });


      }
  }

  @override
  Widget build(BuildContext context)
  {
    final topSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left:15.0, top: 15.0),
          child:    Text('FAVORITE CONTACTS',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 18.0
            ),) ,
        ),
        Container(
          height: 270.0,
          margin: EdgeInsets.only(top: 15.0),
          child:  ListView.builder(
              itemCount: favoriteContacts.length,
              itemBuilder: (BuildContext context, int position)
              {
                return getFavoriteContactItem(position);
              }),
        )

      ],
    );

    final bottomSection =  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left:15.0, top: 15.0),
          child:    Text('OTHER CONTACTS',  style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 18.0
          ),) ,
        ),
        Container(
            height:270.0,
            margin: EdgeInsets.only(top: 15.0),
            child:  ListView.builder(
                itemCount: otherContacts.length,
                itemBuilder: (BuildContext context, int position)
                {
                  return getOtherContactItem(position);
                })
        )

      ],
    );

    return Column(
      children: <Widget>[
        topSection,
        bottomSection
      ],
    );
  }

  Widget getFavoriteContactItem(int position)
  {
    return ContactItem(contact: favoriteContacts[position], position: position,);
  }

  Widget getOtherContactItem(int position)
  {
    return ContactItem(contact: otherContacts[position], position: position,);
  }
}

class ContactItem extends StatelessWidget
{
  final Contact contact;
  final int position;
  ContactItem({Key key, this.contact, this.position}): super(key: key);

  @override
  Widget build(BuildContext context)
  {
      var leftSection = Container(
        margin: const EdgeInsets.only(left: 10.0, right:10.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(contact.smallImageURL),
          radius: 24.0,
        ),
      );

      var middleSection = Container(
          child: contact.isFavorite ? Icon(Icons.star) : Icon(Icons.star_border)
      );

      var rightSection = Container(
          padding: EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child:Text(contact.name != 'null' ? '${contact.name}':'',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0
                  ),),
              ),
              Container(
                  child:Text('${contact.companyName}',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0
                    ),)
              )
            ],
          )
      );

      return  GestureDetector(
                onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactDetailsActivity(contact: contact)
                      ),
                    );
                },
                child:Container(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: <Widget>[
                      leftSection,
                      middleSection,
                      rightSection
                    ],
                  ),
                ),
              );
    }
}