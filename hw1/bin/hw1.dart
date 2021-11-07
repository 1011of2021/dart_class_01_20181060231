// 1.一个简单的Dart程序
// Define a function.
void printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
  // $: Similar to pointer, address
}

// This is where the app starts executing.
void main() {
  var number = 42; // Declare and initialize a variable.
// var : To declare a variable without specifying the type
  printInteger(number); // Call a function.
  


// 2.变量
// Object: If an object isn't restricted to a single type, specify the Object type
  var name = 'Bob';
  Object name = 'Bob';
  String name = 'Bob';



// 3.默认值
// Assert: In normal time, code ignores the assert(condition) call. Assert throws an exception if the condition is false 
  int? lineCount;
  assert(lineCount == null);



// 4.late variables
// late: When you're sure that a variable is set before it's used, but dart disagrees, you can fix it by marking the variable as late
  late description
  description = 'Feijoada!';
  print(description);

// Lazy initializing: When the variable might not be needed, used lazily intitializing will be handy.
  late String temperature = _readThermometer 



// 5.final和const
  final name = 'Bob';
  final String nickname = 'Bobby'; // With a type annotation
  // name = 'Alice' (x). A final variable can be only set once. 

// const: A const variable means it's a compile-time constant. If the const variable is at the class level, mark it static const
  const bar = 1000000;
  const double atm = 1.01325 * bar;

// The const keyword can also be used to create constant values. 
  var foo = const[];
  const baz = [];
// foo = [1,2,3];//(√) You can change the value of a non-final, non-const variable, even if it used to have a const value
// baz = [42];(x) Cuz const variables can't be assigned a value.  

// 'is' is for typechecks, and 'as' is for typecasts
const list = [i as int]; //typecast
const map = {if (i is int) i: 'int'}; //use 'is' as typecheck and collection if



// 内置类型
// 6.Numbers
// There are two variables that represent numbers, int and double. num is a variable that is the superclass of int and double
num x = 1;// x can have both int and double values
double z = 1;// equivalent to double z = 1.0, intengers will be converted automatically to doubles when necessary

// bitwise operation
// shift: assert((3 << 1) == 6)// 0011  ->  0110  
// OR: assert((3 | 4) == 7)// 0011 | 0100 ==0111



// 7.strings
var s1 = 'Single quotes work well for string literals.';
var s2 = 'Double quotes work just as well.';
var s3 = 'It\'s easy to escape the string delimiter.';//which means you can use a '\' before a single quotes to avoid the ambiguity.
var s4 = "It's even easier to use the other delimiter."; //while in the sentences of double quotes, '\' is not necessary.

// expressions: use ${expression} to put the value of an expression inside a string, if the expression is an identifier, you can skip the '{}'
var s = 'string interpolation';
assert('Dart has $s, which is very handy.' //this is equivelant to 'Dart has string interpolation, which is very handy.')
assert('That deserves all caps. ${s.toUpperCase()} is very handy!' //euivelant to 'That deserves all caps. STRING INTERPOLATION is very handy!')

// use '+' to connect multiple strings
var s = 'The + operator ' + 'works, as well.';
assert(s == 'The + operator works, as well.');

// multi-line strings
var s1 = '''
You can create
multi-line strings like this one.
''';
var s2 = """This is also a 
multi-line string.""";

// raw string: You can create a "raw" string by prefixing it with r add a prefix "r". 
var s = r'In a raw string, nothing will be treat specially, not even \n gets special treatment, '\n' will be output instead of wrap. '



// 8.布尔类型
// bool: you can't use code like  "if(nonbooleanValue)" or"assert(nonbooleanValue)", instead, explicitly check for values
// Check for an empty string
var fullName = '';
assert(fullName.isEmpty);
// Check for zero
var hitPoints = 0;
assert(hitPoints <= 0);
// Check for null
var unicorn;
assert(unicorn == null);
// Check for NaN
var iMeantToDoThis = 0 / 0;
assert(iMeantToDoThis.isNaN);



// 9.Lists
var list = [1, 2, 3];
// list has type list<int>.If you try to add non-integer objects to this list, the analyzer or runtime raises an error
var constantList = const [1, 2, 3];
// constantList[1] = 1; //This line will cause an error, because it's a compile-time constant
// spread operator(...)
var list = [1, 2, 3];
var list2 = [0, ...list];
assert(list2.length == 4);
// if the right of the spread operator might be null, you can avoid exceptions by using a null-aware spread operator(...?)
var list;
var list2 = [0, ...?list];
assert(list2.length = 1);
// collection if
var nav = [
  'Home',
  'Furniture',
  'Plants',
  if (promoActive) 'Outlet'//outlet will be created if the condition is true
] 
// collection for
var listOfInts = [1, 2, 3];
var listOfStrings = [
  '#0',
  for (var i in listOfInts) '#$i'
];
assert(listOfStrings[1] == '#1');



// 10.Sets: a set in dart is an unordered collection of unique items
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
// to create an empty set, use{} preceded by a type argument, or assign {} to a variable of type Set
var names = <String>{};
// Set<Strings> names = {}; //This works too
// var names = {}; //this is a map, not a set

// add(), addAll()
var elements = <String>{};
elements.add('fluorine');
elements.addAll(halogens);
assert(elements.length == 5);



// 11.Maps: a map is an object that associates keys and values. Both keys and values can be any type of object. Each key occurs only once, but you can use the same value multiple times.
var gifts = {
  // Key:       Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
};

var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};

// You can create the same objects using a Map constructor
var gifts = Map<String, String>();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

var nobleGases = Map<int, String>();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';
// In Dart, the new keyword is optional, while you might expect to see new 'Map()' in Java

// Add a new key-value pair to an existing map
var gifts = {'first': 'partridge'};
gifts['fourth'] = 'calling birds';

// Retrieve a value from a map
var gifts = {'first': 'partirdge'};
assert(gifts['first'] = 'partridge');

// If you look for a key that isn't in a map, you get a null in return
var gifts = {'first': 'partridge'};
assert(gifts['fifth'] == null);

// Use .length to get the number of key-value pairs in the map
var gifts = {'first': 'partridge'};
gifts['fourth'] = 'calling birds';
assert(gifts.length == 2);



// 12.Runes, graphemes and clusters
"""
In Dart, runes expose the Unicode code points of a string. 
Unicode defines a unique numeric value for each letter, digit, and symbol used in all of the world's wirting systems.

The usual way to express a Unicode code point is \uXXXX, where XXXX is a 4-digit hexadecimal value. For example, the heart character(♥) is \u2665. 
To specify more or less than 4 hex digits, place the value in curly brackets. For example, the laughing emoji(😆) is \u{1f606}
"""

"""
If you need to read or write individual Unicode characters, use the 'characters getter' defined on String by the characters package.
The returned Characters object is the string as a sequence of grapheme clusters.
Here's an example of using the characters API:
import 'package:characters/characters.dart';
var hi = 'Hi DK';
print (hi);
print('The end of the string: ${hi.substring(hi.length - 1)}');
print('The last character: ${hi.characters.last}\n');

The output looks something like this:
Hi 🇩🇰
The end of the string: ???
The last character: 🇩🇰

"""



// 13.Functions
'''
Dart is a true object-oriented language, so even functions are objects and have a type, 'Function'.
This means that functions can be assigned to variables or passed as arguments to other functions.
You can also call an instance(调用实例) of a Dart class as if it were a function.
'''

// Here's an example of implementing a function:
bool isNoble(int atomicNumble) {
  return _nobleGases[atomicNumble] !=null;
}
// Although effective Dart recommends type annotations for public APIs, the function still works if you omit the types:
isNoble(atomicNumble) {
  return _nobleGases[atomicNumble] != null;
}

// For functions that contain just one expression, you can use a shorthand syntax:
bool isNoble(int atomicNumble) => _nobleGases[atomicNumble] != null;
// The '=> expr' syntax is a shorthand for { return expr; }. The notation is sometimes referred to as arrow syntax.
// Only an expression (not a statement) can appear between the arrow (=>) and the semicolon(;). You can't put an if statement there but you can put a conditional expression.



// 14.Parameter
'''A function can have any number of required positional parameters. These can be followed either by named parameters or by optional positional parameters.(but not both)
Some APIs, notably Flutter widget constructors, use only named parameters.
'''

// Named parameters: 
'''
Named parameters are optional unless they're specifically marked as required. If a parameter is optional but can not be null, provide a default value. 
When calling a function, you can specify named parameters using 'paramName: value'. 
For example: enableFlags(bold: true, hidden: false);

When defining a function, use {param1, param2, ...} to specify named parameters: void enableFlags({bool: bold, bool: hidden})
Although named parameters are a kind of optional parameter, you can annotate them with 'required' to indicate that the parameter is mandatory that users must provide a value for the parameter.
For example: const Scrollbar({Key? key, required Widget child})
'''

// Optional Positional parameters: Wrapping a set of function parameters in [] marks them as optional positional parameters:
String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}
// Here's an example of calling this function without the optional parameter:
assert(say('Bob', 'Howdy') == 'Bob says Howdy');
//And here's an example of calling this function with the third parameter:
assert(say('Bob', 'Howdy', 'smoke signal') == 'Bob says Howdy with a smoke signal');

// Default parameter values:
'''
Your function can use = to define default values for both named and positional parameters. 
The default values must be compile-time constants. If no default value is provided, the default value is null.
Here's an example of setting default values for named parameters:
void enableFlags({bool bold = false, bool hidden = false})
enableFlags(bold: ture)

The next example shows how to set default values for positional parameters:
String say(String from, String msg, [String device = 'carrier pigeon']) {
  var result = '$from says $msg with a $device';
  return result;
}
assert(say('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');

You can also pass lists or maps as default values.
'''



// 15.The main() function
'''
Every app must have a top-level main() function, which serves as the entrypoint to the app. 
The main() function returns void and has an optional List<String> parameter for arguments 
'''



// 16.Funtions as first-class objects
// You can pass a function as a parameter to another function. For example:
void printElement(int element) {
  print(element);
}
var list = [1, 2, 3];
list.forEach(printElement);
// You can also assign a function to a variable, such as: 
var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
assert(loudify('hello') == '!!! HELLO !!!');



// 17.Anonymous functions:
'''
Most functions are named, you can also create a nameless function called an anonymous function, or sometimes a lambda or closure.
You might assign an anonymous function to a variable so that, for example, you can add or remove it from a collection. 

//An anonymous function looks similar to a named function
([[type] parameter[, …]]) { 
  function; 
}; 
'''
// The following example difines an anonymous function with an untyped parameter, item. The function is invoked for each item in the list.
const list = ['apples', 'bananas', 'oranges'];
list.forEach((item) {
  print('${list.indexOf(item)}: $item');
});



// 18.Lexical scope(词法作用域)
'''
Dart is a lexically scoped language, which means that the scope of variables is determined statically, simply by the layout of the code. 
You can "follow the curly braces outwards" to see if a variable is in scope. 
'''
// Here's an example of nested functions with variables at each scope level:
bool topLevel = true;
void main() {
  var insideMain = true;
  
  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
      // Notice how nestedFunction() can use variables from every level, all the way up to the top level.  
    }
  }
}



// 19.Lexical closures(词法闭包)
// A closure is a function object that has access to variables in its lexical scope, even when the function is used outside of its original scope.
// In the following example, makeAdder() captures the variable addBy. Wherever the ruturned function goes, it remembers addBy
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}
void main() {
  var add2 = makeAdder(2);
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}



// 20.Testing functions for equality
// Here's an example of testing top-level functions, static method, and instance methods for equality. 
void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}

void main() {
  Function x;

  // Comparing top-level functions
  x = foo;
  assert(foo == x);

  // Comparing static methos
  x = A.bar;
  assert(A.bar == x);

  // Comparing instance methods
  var v = A(); // Instance #1 of A
  var w = A(); // Instance #2 of A
  var y = w;
  x = w.baz;

  assert(y.baz == x);
  assert(v.baz != w.baz);
}

// 21.All functions returns a value. If no return value is specified, 
// the statement 'return null' is implicly appended to the function body.



// 22.Operators
'''
bitwise AND: &
bitwise XOR: ^
bitwise OR: |
if null(空判断): ??
'''

'''
In the operator table, each operator has higher precedence than the operators in the rows that follow it. 
For example, the multiplicative has higher precedence than the quality operator == , which has higher precedence than the logical AND operator &&.
That precedence means that the following two lines of code execute the same way:

//Parentheses improve readability
if ((n % i == 0) && (d % i == 0))...

//Harder to read, but equivalent
if (n % i == 0 && d % 1 == 0)...
'''


// 22.Arithmetic operators
