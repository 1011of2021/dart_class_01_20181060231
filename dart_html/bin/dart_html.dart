/// dart:html
/*
Use the dart:html library to program the browser, manipulate objects and elements in the DOM, and access HTML5 APIs. 
DOM stands for Document Object Model, which describes the hierarchy of an HTML page.
Other common uses of dart:html are manipulating styles (CSS), getting data using HTTP requests, and exchanging data using WebSockets. 
HTML5 (and dart:html) has many additional APIs that this section doesn’t cover. Only web apps can use dart:html, not command-line apps.
 */

 // To use the HTML library in your web app, import dart:html:
import 'dart:html';




 /* 1.Manipulating the DOM: To use the DOM, you need to know about windows, documents, elements, and nodes.

 1 windows: A Window object represents the actual window of the web browser. 
 Each Window has a Document object, which points to the document that’s currently loaded. 
 The Window object also has accessors to various APIs such as IndexedDB (for storing data), requestAnimationFrame (for animations), and more. 
 In tabbed browsers, each tab has its own Window object.
 
 2.documents: With the Document object, you can create and manipulate Element objects within the document. 
 Note that the document itself is an element and can be manipulated.

 3.nodes: The DOM models a tree of Nodes. These nodes are often elements, but they can also be attributes, text, comments, and other DOM types. 
 Except for the root node, which has no parent, each node in the DOM has one parent and might have many children.

 // Manipulating the DOM
To manipulate an element, you first need an object that represents it. You can get this object using a query.
Find one or more elements using the top-level functions querySelector() and querySelectorAll(). 
You can query by ID, class, tag, name, or any combination of these. 
The CSS Selector Specification guide defines the formats of the selectors such as using a # prefix to specify IDs and a period (.) for classes.
 */

 // The querySelector() function returns the first element that matches the selector, while querySelectorAll()returns a collection of elements that match the selector.
 // Find an element by id (an-id).
Element idElement = querySelector('#an-id')!;

// Find an element by class (a-class).
Element classElement = querySelector('.a-class')!;

// Find all elements by tag (<div>).
List<Element> divElements = querySelectorAll('div');

// Find all text inputs.
List<Element> textInputElements = querySelectorAll(
  'input[type="text"]',
);

// Find all elements with the CSS class 'class'
// inside of a <p> that is inside an element with
// the ID 'id'.
List<Element> specialParagraphElements = querySelectorAll('#id p.class');




// 2.Manipulating elements
/*
You can use properties to change the state of an element. Node and its subtype Element define the properties that all elements have. 
For example, all elements have classes, hidden, id, style, and title properties that you can use to set state. 
Subclasses of Element define additional properties, such as the href property of AnchorElement.
 */
<a id="example" href="/another/example">link text</a>
// This <a> tag specifies an element with an href attribute and a text node (accessible via a text property) that contains the string “link text”. 
// To change the URL that the link goes to, you can use AnchorElement’s href property:
var anchor = querySelector('#example') as AnchorElement;
anchor.href = 'https://dart.dev';

/*
Often you need to set properties on multiple elements. 
For example, the following code sets the hidden property of all elements that have a class of “mac”, “win”, or “linux”. 
Setting the hidden property to true has the same effect as adding display: none to the CSS.
 */
<!-- In HTML: -->
<p>
  <span class="linux">Words for Linux</span>
  <span class="macos">Words for Mac</span>
  <span class="windows">Words for Windows</span>
</p>

// In Dart:
const osList = ['macos', 'windows', 'linux'];
final userOs = determineUserOs();

// For each possible OS...
for (final os in osList) {
  // Matches user OS?
  bool shouldShow = (os == userOs);

  // Find all elements with class=os. For example, if
  // os == 'windows', call querySelectorAll('.windows')
  // to find all elements with the class "windows".
  // Note that '.$os' uses string interpolation.
  for (final elem in querySelectorAll('.$os')) {
    elem.hidden = !shouldShow; // Show or hide.
  }
}



// 3.Creating elements
// You can add to existing HTML pages by creating new elements and attaching them to the DOM. 
// Here’s an example of creating a paragraph (<p>) element:
var elem = ParagraphElement();
elem.text = 'Creating is easy!';
// You can also create an element by parsing HTML text. Any child elements are also parsed and created.
var elem2 = Element.html(
  '<p>Creating <em>is</em> easy!</p>',
);




// 4.Adding, replacing, and removing nodes
/*
Recall that elements are just a kind of node. 
You can find all the children of a node using the nodes property of Node, which returns a List<Node> (as opposed to children, which omits non-Element nodes). 
Once you have this list, you can use the usual List methods and operators to manipulate the children of the node.
*/
// To add a node as the last child of its parent, use the List add() method:
querySelector('#inputs')!.nodes.add(elem);

// To replace a node, use the Node replaceWith() method:
querySelector('#status')!.replaceWith(elem);

// To remove a node, use the Node remove() method:
// Find a node by ID, and remove it from the DOM if it is found.
querySelector('#expendable')?.remove();



// 5.Manipulating CSS styles
/*
CSS, or cascading style sheets, defines the presentation styles of DOM elements. 
You can change the appearance of an element by attaching ID and class attributes to it.
Each element has a classes field, which is a list. 
Add and remove CSS classes simply by adding and removing strings from this collection.
For example, the following sample adds the warning class to an element:
*/
var elem = querySelector('#message')!;
elem.classes.add('warning');

// It’s often very efficient to find an element by ID. You can dynamically set an element ID with the id property:
var message = DivElement();
message.id = 'message2';
message.text = 'Please subscribe to the Dart mailing list.';

// You can reduce the redundant text in this example by using method cascades:
var message = DivElement()
  ..id = 'message2'
  ..text = 'Please subscribe to the Dart mailing list.';

// While using IDs and classes to associate an element with a set of styles is best practice, 
// sometimes you want to attach a specific style directly to the element:
message.style
  ..fontWeight = 'bold'
  ..fontSize = '3em';



// 6.Handling events
/*
To respond to external events such as clicks, changes of focus, and selections, add an event listener. 
You can add an event listener to any element on the page. Event dispatch and propagation is a complicated subject; research the details if you’re new to web programming.
*/

// Add an event handler using element.onEvent.listen(function), where Event is the event name and function is the event handler.
// For example, here’s how you can handle clicks on a button:
// Find a button by ID and add an event handler.
querySelector('#submitInfo')!.onClick.listen((e) {
  // When the button is clicked, it runs this code.
  submitData();
});

// Events can propagate up and down through the DOM tree. To discover which element originally fired the event, use e.target:
document.body!.onClick.listen((e) {
  final clickedElem = e.target;
  // ...
});



// 7.Using HTTP resources with HttpRequest
/*
Formerly known as XMLHttpRequest, the HttpRequest class gives you access to HTTP resources from within your browser-based app. 
Traditionally, AJAX-style apps make heavy use of HttpRequest. 
Use HttpRequest to dynamically load JSON data or any other resource from a web server. You can also dynamically send data to a web server.
*/

// Getting data from the server
// The HttpRequest static method getString() is an easy way to get data from a web server. 
// Use await with the getString() call to ensure that you have the data before continuing execution.
Future<void> main() async {
  String pageHtml = await HttpRequest.getString(url);
  // Do something with pageHtml...
}

// Use try-catch to specify an error handler:
try {
  var data = await HttpRequest.getString(jsonUri);
  // Process data...
} catch (e) {
  // Handle exception...
}

// If you need access to the HttpRequest, not just the text data it retrieves, you can use the request() static method instead of getString(). 
// Here’s an example of reading XML data:
Future<void> main() async {
  HttpRequest req = await HttpRequest.request(
    url,
    method: 'HEAD',
  );
  if (req.status == 200) {
    // Successful URL access...
  }
  // ···
}

// You can also use the full API to handle more interesting cases. For example, you can set arbitrary headers.
/*
The general flow for using the full API of HttpRequest is as follows:
Create the HttpRequest object.
Open the URL with either GET or POST.
Attach event handlers.
Send the request.
*/

// For example:
var request = HttpRequest();
request
  ..open('POST', url)
  ..onLoadEnd.listen((e) => requestComplete(request))
  ..send(encodedData);

// Sending data to the server
/*
HttpRequest can send data to the server using the HTTP method POST. For example, you might want to dynamically submit data to a form handler. 
Sending JSON data to a RESTful web service is another common example.
Submitting data to a form handler requires you to provide name-value pairs as URI-encoded strings.
(Information about the URI class is in the URIs section of the Dart Library Tour.) 
You must also set the Content-type header to application/x-www-form-urlencoded if you wish to send data to a form handler.
*/

String encodeMap(Map<String, String> data) => data.entries
    .map((e) =>
        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
    .join('&');

Future<void> main() async {
  const data = {'dart': 'fun', 'angular': 'productive'};

  var request = HttpRequest();
  request
    ..open('POST', url)
    ..setRequestHeader(
      'Content-type',
      'application/x-www-form-urlencoded',
    )
    ..send(encodeMap(data));

  await request.onLoadEnd.first;

  if (request.status == 200) {
    // Successful URL access...
  }
  // ···
}



// 8.Sending and receiving real-time data with WebSockets
/*
A WebSocket allows your web app to exchange data with a server interactively—no polling necessary. 
A server creates the WebSocket and listens for requests on a URL that starts with ws://—for example, ws://127.0.0.1:1337/ws. 
The data transmitted over a WebSocket can be a string or a blob. Often, the data is a JSON-formatted string.
*/ 

// To use a WebSocket in your web app, first create a WebSocket object, passing the WebSocket URL as an argument:
var ws = WebSocket('ws://echo.websocket.org');

// Sending data
// To send string data on the WebSocket, use the send() method:
ws.send('Hello from Dart!');

// Receiving data
// To receive data on the WebSocket, register a listener for message events:
ws.onMessage.listen((MessageEvent e) {
  print('Received message: ${e.data}');
});



// 9.Handling WebSocket events
/*
Your app can handle the following WebSocket events: open, close, error, and (as shown earlier) message. 
Here’s an example of a method that creates a WebSocket object and registers handlers for open, close, error, and message events:
*/
void initWebSocket([int retrySeconds = 1]) {
  var reconnectScheduled = false;

  print('Connecting to websocket');

  void scheduleReconnect() {
    if (!reconnectScheduled) {
      Timer(Duration(seconds: retrySeconds),
          () => initWebSocket(retrySeconds * 2));
    }
    reconnectScheduled = true;
  }

  ws.onOpen.listen((e) {
    print('Connected');
    ws.send('Hello from Dart!');
  });

  ws.onClose.listen((e) {
    print('Websocket closed, retrying in $retrySeconds seconds');
    scheduleReconnect();
  });

  ws.onError.listen((e) {
    print('Error connecting to ws');
    scheduleReconnect();
  });

  ws.onMessage.listen((MessageEvent e) {
    print('Received message: ${e.data}');
  });
}


