///File description: Access Emergency Contacts page.
///User can add, delete, edit and view emergency contacts.
import 'package:flutter/material.dart';
import 'package:blmhackathon/models/user.dart';
import 'package:blmhackathon/models/contact.dart';
import 'package:blmhackathon/services/database.dart';
import 'package:blmhackathon/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:blmhackathon/shared/loading.dart';
import 'package:blmhackathon/shared/navigationMenu.dart';
import 'package:blmhackathon/screens/menuActions/access_emergency_contacts/emergencyContactsCard.dart';
import 'package:blmhackathon/screens/menuActions/document_situation/menuItem.dart';
import 'package:blmhackathon/screens/menuActions/access_emergency_contacts/addEmergencyContact.dart';
import 'package:blmhackathon/shared/constants.dart';

class EmergencyContacts extends StatefulWidget {
  @override
  _EmergencyContactsState createState() => _EmergencyContactsState();
}

class _EmergencyContactsState extends State<EmergencyContacts> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final AuthService _auth = AuthService();

    return StreamBuilder<List<Contact>>(
        stream: DatabaseService(uid: user.uid).contactData,

        builder: (context, snapshot){
          if (snapshot.hasData){
            List<Contact> eContacts = snapshot.data;
            print(eContacts.length);
            return Scaffold(
              resizeToAvoidBottomPadding: false,

              ///menu slider window
              drawer: NavigationMenu(),

              ///app bar
              appBar: new AppBar(
                  title: new Text("Emergency Contacts")
              ),

              ///body
              body: Center(
                child: Container(
                    child: Column(children: <Widget>[
                      SizedBox(height: 30),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: eContacts.length,
                            itemBuilder: (context, index){
                              return EmergencyContactsCard(emerContact: eContacts[index], userId: user.uid);
                            }
                        ),
                      ),
                      SizedBox(height: 20),

                    ],)
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                label: Row(children: <Widget>[
                  Text("Add Emergency Contact", style: TextStyle(fontSize: defaultFontSize, color: color3)),
                  SizedBox(width: 10),
                  Icon(Icons.add, color: color3)
                ],),
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => AddEmergencyContact()));
                },
              ),

            );
          }
          else{
            return Loading();
          }
        }
    );
  }
}
