import 'package:contact_flutter/models/contact.dart';
import 'package:flutter/material.dart';

class ContactDetailsActivity extends StatelessWidget
{
    final Contact contact;

    ContactDetailsActivity({Key key, @required this.contact}) : super(key: key);

    @override
    Widget build(BuildContext context)
    {
        var imageSection = Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             mainAxisSize: MainAxisSize.min,
                             children: <Widget>[
                                      Container(
                                            margin: EdgeInsets.only(top:20.0, left:20.0),
                                            child: CircleAvatar(
                                                    backgroundImage: NetworkImage(contact.largeImageURL),
                                                    radius: 64.0,
                                            ),
                                      ),
                                      Container(
                                            margin: EdgeInsets.only(top:10.0),
                                            child: Text("${contact.name}",
                                                                        style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontWeight: FontWeight.w600,
                                                                        fontSize: 20.0
                                            ),),
                                      ),
                                      Container(
                                            child: Text('${contact.companyName}',
                                                                        style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontWeight: FontWeight.w600,
                                                                        fontSize: 15.0
                                                                        ),
                                      ))
                             ],
                        );



        return Scaffold(
                appBar: AppBar(
                        title: Text('Contact Details'),
                ),
                body: ListView(
                           children: [
                                    imageSection,
                                    buildPhoneSection("${contact.phone.work}", "WORK"),
                                    buildPhoneSection("${contact.phone.home}", "HOME"),
                                    buildPhoneSection("${contact.phone.mobile}", "MOBILE"),
                                    buildOtherSections("ADDRESS:", "${contact.address.street}, ${contact.address.city}, ${contact.address.state}, ${contact.address.zipCode} , US"),
                                    buildOtherSections("BIRTHDATE:", "${contact.birthdate}"),
                                    buildOtherSections("EMAIL:", "${contact.emailAddress}"),
                           ],
                )

        );
    }

    Widget buildOtherSections(String fieldName, String content)
    {
        return Container(

                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                                  Container(
                                                    padding: const EdgeInsets.only(bottom: 8.0),
                                                    child: Text(
                                                            fieldName,
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 18.0
                                                            ),
                                                    ),
                                                  ),
                                                  Container(
                                                      padding: const EdgeInsets.only(bottom: 8.0),
                                                      child: Text(
                                                            content,
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18.0
                                                            ),
                                                      )
                                                  )
                                        ],
                              )
                );

    }

    Widget buildPhoneSection(String phoneNumber, String phoneType)
    {
              return  Container(
                                        child: Row(
                                                children:[
                                                Expanded(
                                                      child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: <Widget>[
                                                                      Container(
                                                                              padding: const EdgeInsets.only(bottom: 8.0),
                                                                              child: Text(
                                                                                      "PHONE:",
                                                                                      style: TextStyle(
                                                                                      color: Colors.black,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontSize: 18.0
                                                                                      ),
                                                                                    ),
                                                                              ),
                                                                      Container(
                                                                              padding: const EdgeInsets.only(bottom: 8.0),
                                                                              child: Text(
                                                                                      phoneNumber,
                                                                                      style: TextStyle(
                                                                                              color: Colors.black,
                                                                                              fontSize: 18.0
                                                                                              ),
                                                                                     )
                                                                      )
                                                              ],
                                                      )

                                              ),
                                              Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                    Container(
                                                            padding: const EdgeInsets.only(),
                                                            child:Text(
                                                                  phoneType,
                                                                  style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 18.0
                                                                    ),
                                                                  )
                                                            )
                                                  ],
                                              )
                                            ],
                                  ),
                          );

    }
}