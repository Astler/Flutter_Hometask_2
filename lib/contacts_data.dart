import 'dart:math';

class ContactData {
  final int id;
  final String name;
  final String surname;
  final String company;
  final String icon_name;
  bool isFavorite;

  ContactData(this.id, this.name, this.surname, this.company, this.icon_name,
      this.isFavorite);
}

class ContactsDataModel {
  List<ContactData> getContacts() {
    return List<ContactData>.generate(50, (index) {
      return ContactData(
          index,
          namesPool[Random().nextInt(namesPool.length)],
          surnamesPool[Random().nextInt(surnamesPool.length)],
          companiesPool[Random().nextInt(companiesPool.length)],
          photosPool[Random().nextInt(photosPool.length)],
          Random().nextInt(3) == 1);
    });
  }
}

var namesPool = [
  'Vlad',
  'Alex',
  'Andrey',
  'Yuri',
  'Dora',
  'John',
  'Vitaliy',
  'Joshua',
  'Sam',
  'Megan',
  'Joel',
  'Kyle',
  'Lauren'
];

var surnamesPool = [
  'Smith',
  'Jones',
  'Williams',
  'Brown',
  'Taylor',
  'Davies',
  'Evans',
  'Thomas',
  'Johnson',
  'Lee',
  'Walker',
  'Wright',
  'Thompson',
  'White',
  'Hughes',
  'Edwards',
  'Agnew',
  'Allison',
  'Barnard',
  'Blakely',
  'Cannon',
  'Dickenson',
  'Davis',
];

var companiesPool = [
  'Stanford University',
  'Hooli Inc.',
  'UC Berkeley',
  'Husky Energy',
  'CAT',
  'Pied Piper',
  'Hollywood',
  'Valve',
  'Alphabet',
  'Apple',
  'Amazon',
];

var photosPool = [
  'photo1.jpg',
  'photo2.jpg',
  'photo3.jpg',
  'photo4.jpg',
  'photo5.jpg',
  'photo6.jpg',
];
