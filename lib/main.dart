import 'package:flutter/material.dart';

import 'contacts_data.dart';
import 'list_items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HW2',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'HW2 Contacts List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _rawList = ContactsDataModel().getContacts();

  List<ListItem> getSortedList() {
    var _newRawList = List<ListItem>.empty(growable: true);

    _rawList.sort((a, b) => a.surname.compareTo(b.surname));

    var firstLetter = _rawList.first.surname[0];

    _newRawList.add(HeaderItem(firstLetter));

    var _byLetterArray = List<ContactData>.empty(growable: true);

    for (var contactData in _rawList) {
      var contactFirstLetter = contactData.surname[0];

      if (firstLetter == contactFirstLetter) {
        _byLetterArray.add(contactData);
      } else {
        _byLetterArray.sort((first, second) => first.name.compareTo(second.name));

        _byLetterArray.forEach((element) {
          _newRawList.add(ContactItem(element));
        });

        _byLetterArray.forEach((element) {
          print(element.name);
        });

        _byLetterArray.clear();
        firstLetter = contactFirstLetter;
        _newRawList.add(HeaderItem(firstLetter));
        _byLetterArray.add(contactData);
      }
    }

    _byLetterArray.sort((first, second) => first.name.compareTo(second.name));

    _byLetterArray.forEach((element) {
      _newRawList.add(ContactItem(element));
    });

    return _newRawList;
  }

  var sortedList = List.empty(growable: true);

  void _reloadList() {
    setState(() {
      sortedList = getSortedList();
    });
  }

  @override
  Widget build(BuildContext context) {
    sortedList = getSortedList();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: sortedList.length,
                  itemBuilder: (_, index) {
                    final item = sortedList[index];

                    return ListTile(
                        title: item.buildTitle(context),
                        subtitle: item.buildSubtitle(context),
                        leading: item.buildIcon(
                            context,
                            () => {
                              if (item is ContactItem) {
                                item.data.isFavorite = !item.data.isFavorite
                              },
                              _reloadList()
                            }));
                  }),
            ),
          ],
        ));
  }
}
