import 'package:flutter/material.dart';
import '../db/DatabaseProvider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

enum Gender { Male, Female }

class _HomeState extends State<Home> {
  Gender gender = Gender.Male;
  bool _isKennel = false;
  String breedValue = 'Breed one';
  String primaryColor = 'Brown';
  int firstYear = 2015;

  void initState() {
    super.initState();
    insertBasicData();
  }

  insertBasicData() async {
    int id = await DatabaseProvider.instance.insert({
      DatabaseProvider.APPLICATION_NAME: 'APPLICATION_NAME',
      DatabaseProvider.IS_KENNEL: 'NO',
      DatabaseProvider.DOG_NAME: 'BRUNO',
      DatabaseProvider.GENDER: 'MALE',
      DatabaseProvider.BREED: 'BREED',
      DatabaseProvider.PRIMARY_COLOR: 'PRIMARY_COLOR',
      DatabaseProvider.SECONDARY_COLOR: 'SECONDARY_COLOR',
      DatabaseProvider.APPLICANT_NAME: 'APPLICANT_NAME',
      DatabaseProvider.APPLICANT_ADDRESS: 'APPLICANT_ADDRESS',
      DatabaseProvider.OWNER_NAME: 'OWNER_ADDRESS',
      DatabaseProvider.OWNER_ADDRESS: 'OWNER_ADDRESS',
      DatabaseProvider.AGE: 'AGE',
      DatabaseProvider.LICENSE_FEE: 'LICENSE_FEE',
    });
    print(id);
  }

  Widget createLabel({String content}) {
    return Text(content, style: TextStyle(fontSize: 25));
  }

  Widget createTextField() {
    return Container(
      child: TextField(),
      width: 300,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog License Registration'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Please correct any errors or ommissions',
                style: TextStyle(fontSize: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    createLabel(content: 'Application Name: '),
                    Container(
                      width: 300, // do it in both Container
                      child: TextField(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 400,
                        child: CheckboxListTile(
                          title: createLabel(content: 'Kennel (4 dog or more)'),
                          value: _isKennel,
                          onChanged: (newValue) {
                            setState(() {
                              _isKennel = !_isKennel;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ))
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    createLabel(content: 'Dog Name: '),
                    Container(
                      width: 300, // do it in both Container
                      child: TextField(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    createLabel(content: 'Gender: '),
                    Container(
                      width: 175,
                      child: ListTile(
                          leading: Radio<Gender>(
                              value: Gender.Male,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              }),
                          title: createLabel(content: 'Male ')),
                    ),
                    Container(
                      width: 185,
                      child: ListTile(
                          leading: Radio<Gender>(
                              value: Gender.Female,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              }),
                          title: createLabel(content: 'Female ')),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    createLabel(content: 'Select Breed'),
                    DropdownButton(
                        value: breedValue,
                        onChanged: (newValue) {
                          setState(() {
                            breedValue = newValue;
                          });
                        },
                        items: <String>['Breed one', 'Breed two', 'Breed three']
                            .map((e) => DropdownMenuItem(
                                child: createLabel(content: e), value: e))
                            .toList()),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        createLabel(content: 'Primary Color'),
                        SizedBox(width: 10),
                        DropdownButton(
                            value: primaryColor,
                            onChanged: (newValue) {
                              setState(() {
                                primaryColor = newValue;
                              });
                            },
                            items: <String>['Brown', 'Black', 'Red']
                                .map((e) => DropdownMenuItem(
                                    child: createLabel(content: e), value: e))
                                .toList()),
                      ],
                    ),
                    Row(
                      children: [
                        createLabel(content: 'Primary Color'),
                        SizedBox(width: 10),
                        DropdownButton(
                            value: primaryColor,
                            onChanged: (newValue) {
                              setState(() {
                                primaryColor = newValue;
                              });
                            },
                            items: <String>['Brown', 'Black', 'Red']
                                .map((e) => DropdownMenuItem(
                                    child: createLabel(content: e), value: e))
                                .toList()),
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(child: createLabel(content: 'Application Name')),
                Column(
                  children: [
                    createTextField(),
                    createTextField(),
                    createTextField(),
                    createTextField(),
                  ],
                ),
                Container(child: createLabel(content: 'Application Address')),
                Column(
                  children: [
                    createTextField(),
                    createTextField(),
                    createTextField(),
                    createTextField(),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createLabel(content: 'Owner Name'),
                createTextField(),
                createLabel(content: 'Owner Address'),
                Column(
                  children: [
                    createTextField(),
                    createTextField(),
                    createTextField(),
                    createTextField(),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    createLabel(content: 'Age: '),
                    DropdownButton(
                        value: firstYear,
                        onChanged: (newValue) {
                          setState(() {
                            firstYear = newValue;
                          });
                        },
                        items: <int>[2015, 2016, 2017]
                            .map((e) => DropdownMenuItem(
                                child: createLabel(content: e.toString()),
                                value: e))
                            .toList()),
                    DropdownButton(
                        value: firstYear,
                        onChanged: (newValue) {
                          setState(() {
                            firstYear = newValue;
                          });
                        },
                        items: <int>[2015, 2016, 2017]
                            .map((e) => DropdownMenuItem(
                                child: createLabel(content: e.toString()),
                                value: e))
                            .toList()),
                  ],
                ),
                createLabel(content: 'Dog License Fee'),
                createTextField(),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              OutlinedButton(
                  child: createLabel(content: 'Submit'), onPressed: () {}),
              OutlinedButton(
                  child: createLabel(content: 'Cancel'), onPressed: () {}),
            ])
          ],
        ),
      ),
    );
  }
}
