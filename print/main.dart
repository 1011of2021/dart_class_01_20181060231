import 'dart:async';
import 'dart:html';
import 'dart:convert';

late final UListElement wordList = querySelector('#wordList') as UListElement;

// Input fields
late final InputElement favoriteNumber;
late final InputElement valueOfPi;
late final InputElement horoscope;
late final InputElement favOne;
late final InputElement favTwo;
late final InputElement favThree;
late final RadioButtonInputElement loveChocolate;
late final RadioButtonInputElement noLoveForChocolate;

// Result fields
late final TextAreaElement intAsJson;
late final TextAreaElement doubleAsJson;
late final TextAreaElement stringAsJson;
late final TextAreaElement listAsJson;
late final TextAreaElement boolAsJson;
late final TextAreaElement mapAsJson;

void _populateFromJson() {
  const jsonDataAsString = '''{
    "favoriteNumber": 73,
    "valueOfPi": 3.141592,
    "chocolate": true,
    "horoscope": "Cancer",
    "favoriteThings": ["monkeys", "parrots", "lattes"]
  }''';

  Map jsonData = json.decode(jsonDataAsString) as Map;

  favoriteNumber.value = jsonData['favoriteNumber'].toString();
  valueOfPi.value = jsonData['valueOfPi'].toString();
  horoscope.value = jsonData['horoscope'].toString();
  final favoriteThings = jsonData['favoriteThings'] as List<String>;
  favOne.value = favoriteThings[0];
  favTwo.value = favoriteThings[1];
  favThree.value = favoriteThings[2];

  final chocolateRadioButton =
      jsonData['chocolate'] == false ? noLoveForChocolate : loveChocolate;
  chocolateRadioButton.checked = true;
}

Iterable<String> thingsTodo() sync* {
  const actions = ['Walk', 'Wash', 'Feed'];
  const pets = ['cats', 'dogs'];

  for (final action in actions) {
    for (final pet in pets) {
      if (pet != 'cats' || action == 'Feed') {
        yield '$action the $pet';
      }
    }
  }
}

LIElement newLI(String itemText) => LIElement()..text = itemText;


void _showJson([Event? _]) {
  // Grab the data that will be converted to JSON.
  final favNum = int.tryParse(favoriteNumber.value ?? '');
  final pi = double.tryParse(valueOfPi.value ?? '');
  final chocolate = loveChocolate.checked;
  final sign = horoscope.value;
  final favoriteThings = <String>[
    favOne.value ?? '',
    favTwo.value ?? '',
    favThree.value ?? '',
  ];
  

  final formData = {
    'favoriteNumber': favNum,
    'valueOfPi': pi,
    'chocolate': chocolate,
    'horoscope': sign,
    'favoriteThings': favoriteThings
  };

  // Convert to JSON and display results.
  intAsJson.text = json.encode(favNum);
  doubleAsJson.text = json.encode(pi);
  boolAsJson.text = json.encode(chocolate);
  stringAsJson.text = json.encode(sign);
  listAsJson.text = json.encode(favoriteThings);
  mapAsJson.text = json.encode(formData);
}

const jsonDataAsString = '''{
  "favoriteNumber": 73,
  "valueOfPi": 3.141592,
  "chocolate": true,
  "horoscope": "Cancer",
  "favoriteThings": ["monkeys", "parrots", "lattes"]
}''';

Map<String, dynamic> jsonData =
    json.decode(jsonDataAsString) as Map<String, dynamic>;



void requestComplete(HttpRequest request) {
  if (request.status == 200) {
    final response = request.responseText;
    if (response != null) {
      processResponse(response);
      return;
    }
  }

  // The GET request failed. Handle the error.
  final li = LIElement()..text = 'Request failed, status=${request.status}';
  wordList.children.add(li);
}

void processResponse(String jsonString) {
  for (final portmanteau in json.decode(jsonString)) {
    wordList.children.add(LIElement()..text = portmanteau as String);
  }
}

void main() {

    // Set up the input text areas.
  favoriteNumber = querySelector('#favoriteNumber') as InputElement;
  valueOfPi = querySelector('#valueOfPi') as InputElement;
  horoscope = querySelector('#horoscope') as InputElement;
  favOne = querySelector('#favOne') as InputElement;
  favTwo = querySelector('#favTwo') as InputElement;
  favThree = querySelector('#favThree') as InputElement;
  loveChocolate = querySelector('#loveChocolate') as RadioButtonInputElement;
  noLoveForChocolate =
      querySelector('#noLoveForChocolate') as RadioButtonInputElement;

  // Set up the results text areas
  // to display the values as JSON.
  intAsJson = querySelector('#intAsJson') as TextAreaElement;
  doubleAsJson = querySelector('#doubleAsJson') as TextAreaElement;
  boolAsJson = querySelector('#boolAsJson') as TextAreaElement;
  stringAsJson = querySelector('#stringAsJson') as TextAreaElement;
  listAsJson = querySelector('#listAsJson') as TextAreaElement;
  mapAsJson = querySelector('#mapAsJson') as TextAreaElement;

  // Set up the listeners.
  favoriteNumber.onKeyUp.listen(_showJson);
  valueOfPi.onKeyUp.listen(_showJson);
  loveChocolate.onClick.listen(_showJson);
  noLoveForChocolate.onClick.listen(_showJson);
  horoscope.onKeyUp.listen(_showJson);
  favOne.onKeyUp.listen(_showJson);
  favTwo.onKeyUp.listen(_showJson);
  favThree.onKeyUp.listen(_showJson);

  _populateFromJson();
  _showJson();

  querySelector('#getWords')!.onClick.listen(makeRequest);
  
}


Future<void> makeRequest(Event _) async {
  const path = 'https://dart.dev/f/portmanteaux.json';
  final httpRequest = HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send('');
    /*
  try {
    // Make the GET request
    final jsonString = await HttpRequest.getString(path);
    // The request succeeded. Process the JSON.
    processResponse(jsonString);
  } catch (e) {
    // The GET request failed. Handle the error.
    print("Couldn't open $path");
    wordList.children.add(LIElement()..text = 'Request failed.');
  }
  */
}

