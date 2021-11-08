/// Dart开发语言概览


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
//Object: If an object isn't restricted to a single type, specify the Object type
  var name = 'Bob';
//Object name = 'Bob';
//String name = 'Bob';
  



// 3.默认值
// Assert: In normal time, code ignores the assert(condition) call. Assert throws an exception if the condition is false 

int? lineCount;
assert(lineCount == null);



// 4.late variables
// late: When you're sure that a variable is set before it's used, but dart disagrees, you can fix it by marking the variable as late
 
  late String description;
  description = 'Feijoada!';
  print(description);


// Lazy initializing: When the variable might not be needed, used lazily intitializing will be handy.
 //late String temperature = _readThermometer; 



// 5.final和const
  final Name = 'Bob';
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

const Object i = 3; // Where i is a const Object with an int value
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
assert('Dart has $s, which is very handy.'); //this is equivelant to 'Dart has string interpolation, which is very handy.')
assert('That deserves all caps. ${s.toUpperCase()} is very handy!'); //euivelant to 'That deserves all caps. STRING INTERPOLATION is very handy!')

// use '+' to connect multiple strings
var ss = 'The + operator ' + 'works, as well.';
assert(ss == 'The + operator works, as well.');

// multi-line strings
var s11 = '''
You can create
multi-line strings like this one.
''';
var s22 = """This is also a 
multi-line string.""";

// raw string: You can create a "raw" string by prefixing it with r add a prefix "r". 
var sn = r'In a raw string, nothing will be treat specially, not even \n gets special treatment, \n will be output instead of wrap. ';



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
var listn = [1, 2, 3];
// list has type list<int>.If you try to add non-integer objects to this list, the analyzer or runtime raises an error
var constantList = const [1, 2, 3];
// constantList[1] = 1; //This line will cause an error, because it's a compile-time constant
// spread operator(...)
var listnn = [1, 2, 3];
var list2 = [0, ...list];
assert(list2.length == 4);
// if the right of the spread operator might be null, you can avoid exceptions by using a null-aware spread operator(...?)
var listnn;
var listnn2 = [0, ...?list];
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
/*
In Dart, runes expose the Unicode code points of a string. 
Unicode defines a unique numeric value for each letter, digit, and symbol used in all of the world's wirting systems.

The usual way to express a Unicode code point is \uXXXX, where XXXX is a 4-digit hexadecimal value. For example, the heart character(♥) is \u2665. 
To specify more or less than 4 hex digits, place the value in curly brackets. For example, the laughing emoji(😆) is \u{1f606}

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

*/



// 13.函数, Functions
/*
Dart is a true object-oriented language, so even functions are objects and have a type, 'Function'.
This means that functions can be assigned to variables or passed as arguments to other functions.
You can also call an instance(调用实例) of a Dart class as if it were a function.
*/

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



// 14.参数, Parameter
/*
A function can have any number of required positional parameters. These can be followed either by named parameters or by optional positional parameters.(but not both)
Some APIs, notably Flutter widget constructors, use only named parameters.

Named parameters: 
Named parameters are optional unless they're specifically marked as required. If a parameter is optional but can not be null, provide a default value. 
When calling a function, you can specify named parameters using 'paramName: value'. 
For example: enableFlags(bold: true, hidden: false);

When defining a function, use {param1, param2, ...} to specify named parameters: void enableFlags({bool: bold, bool: hidden})
Although named parameters are a kind of optional parameter, you can annotate them with 'required' to indicate that the parameter is mandatory that users must provide a value for the parameter.
For example: const Scrollbar({Key? key, required Widget child})
*/

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
/*
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
*/



// 15.main()函数, The main() function
/*
Every app must have a top-level main() function, which serves as the entrypoint to the app. 
The main() function returns void and has an optional List<String> parameter for arguments 
*/



// 16.函数是一级对象, Funtions as first-class objects
// You can pass a function as a parameter to another function. For example:
void printElement(int element) {
  print(element);
}
var list = [1, 2, 3];
list.forEach(printElement);
// You can also assign a function to a variable, such as: 
var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
assert(loudify('hello') == '!!! HELLO !!!');



// 17.匿名函数, Anonymous functions:
/*
Most functions are named, you can also create a nameless function called an anonymous function, or sometimes a lambda or closure.
You might assign an anonymous function to a variable so that, for example, you can add or remove it from a collection. 

//An anonymous function looks similar to a named function
([[type] parameter[, …]]) { 
  function; 
}; 
*/

// The following example difines an anonymous function with an untyped parameter, item. The function is invoked for each item in the list.
const list = ['apples', 'bananas', 'oranges'];
list.forEach((item) {
  print('${list.indexOf(item)}: $item');
});



// 18.词法作用域, Lexical scope
/*
Dart is a lexically scoped language, which means that the scope of variables is determined statically, simply by the layout of the code. 
You can "follow the curly braces outwards" to see if a variable is in scope. 
*/

// Here's an example of nested functions with variables at each scope level:
bool topLevel = true;
/*
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
*/


// 19.词法闭包, Lexical closures
// A closure is a function object that has access to variables in its lexical scope, even when the function is used outside of its original scope.
// In the following example, makeAdder() captures the variable addBy. Wherever the ruturned function goes, it remembers addBy
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}
/*
void main() {
  var add2 = makeAdder(2);
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}
*/



// 20.测试函数是否相等, Testing functions for equality
// Here's an example of testing top-level functions, static method, and instance methods for equality. 
void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}

/*
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
*/



// 21.返回值, All functions returns a value. If no return value is specified, 
// the statement 'return null' is implicly appended to the function body.



// 22.Operators
/*
bitwise AND: &
bitwise XOR: ^
bitwise OR: |
if null(空判断): ??

In the operator table, each operator has higher precedence than the operators in the rows that follow it. 
For example, the multiplicative has higher precedence than the quality operator == , which has higher precedence than the logical AND operator &&.
That precedence means that the following two lines of code execute the same way:

//Parentheses improve readability
if ((n % i == 0) && (d % i == 0))...

//Harder to read, but equivalent
if (n % i == 0 && d % 1 == 0)...
*/



// 22.类型判断运算符, Type test operators
/*
as: typecast
is: true if the object has the specified type
is!: true if the object doesn't have the specified type
The result of 'obj is T' is true if obj implements the interface specified by T.
Use the as operator to cast an object to a particular type if and only if you are sure that the object is of that type.
Example: (employee as person).firstName = 'Bob';
If you aren't sure that the object is of type T, then use 'is T' to check the type before using the object.
*/



// 23.运算符, operators
/*
~expression: 按位取反
<<: 左移
>>>: 无符号右移
*/



// 24.条件表达式, conditional expressions:
/*
1.condition ? expr1 : expr2
2.expr1 ?? expr2     : If the expr1 is not null, returns its value, otherwise, evaluates and returns the values of expr2 

When you need to assign a value based on a boolean expression, consider using ? and :
var visibility = isPublic ? 'public' : 'private';

If the boolean expression tests for null, consider using ??
String plaryerName(String? Name) => name ?? 'Guest';
*/



// 25.级联运算符, cascade notation
/*
Cascades allow you to make a sequence of operations on the same object. 
var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;

The code above is equivalent to:
var paint = Paint();
paint.color = Colors.black;
paint.strokeCap = StrokeCap.round;
paint.strokeWidth = 5.0;

If the object that the cascade operates on can be null, then use a null-shorting cascade (?..) for the first operation. 
Starting with ?.. guarantees that none of the cascade operations are attempted on that null object.
*/

// '?.' 是条件访问成员，但是左边的对象不能为空



// 26.流程控制语句, Control flow statements
/*
1.if-else: conditions must be boolean values, nothing else, for example:
if (isRaining()) {
  you.bringRainCoat();
}
2.For:
If the object that you are iterating over is an iterable(such as List or Set) 
and if you don't need to know the current iteration conter, you can use the for-in form of iteration:
for (final candidate in candidates) {
  candidate.interview();
}
Iterable classes also have a forEach() method as another option:
var collection = [1, 2, 3];
collection.forEach(print);
*/



// 27.断言 Assert
/*
During development, use an assert statement 'assert(condition, optionalMessage);' 
to disrupt normal execution if a boolean condition is false. For example: 
// Make sure the variable has a non-null value
assert(text != null);

// Make sure the value is less than 100
assert(number < 100);

// Make sure this is an https URL
assert(urlString.startsWith('https'));

//To attach a message to an assertion, add a string as the second argument to assert
assert(urlString.startsWith('https), 'URL ($urlString) should start with "https".');

The first argument to assert can be any expression that resolves to a boolean valule. 
If the expression's value is true, the assertion succeeds and execution continues. 
If it's false, the assertion fails and an exception is thrown.
*/



// 28.类, class
//Instance variables
class Point {
  double? x;// Declare instance variable x, initially null
}

//构造函数, constructors
//Declare a constructor by creating a function with the same name as its class
class Point {
  double x = 0;
  double y = 0;
  Point(double x, double y) {
    this.x = x;
    this.y = y;
    // Use this only when there is a name conflict. Otherwise, Dart style omits the 'this'.
  }
}
/*
Default constructors: If you don't declare a constructor, a default constructor is provided for you. 
The default constructor has no arguments and invokes the no-argument constructor in the superclass. 
Subclasses don't inherit constructors from their superclass.
*/



// 29.方法, Method: method are functios that provid behavior for an object
//抽象方法, Abstract methods: Defining an interface but leaving its implementation up to other classes. Abstract methods can only exist in abstract classes. 
abstract class Doer {
  // Define instance variables and methods
  void doSomething(); // Define an abstract method
}

class EffectiveDoer extends Doer {
  void doSomething() {
    // Provide an implementation, so the method is not abstract here
  }
}



// 30.抽象类, Abstract class
/*
Use the abstract modifier to define an abstract class--a class that can't be instantiated.  
Abstract classes are useful for defining interfaces, often with some implementation. 
*/

// Abstract classes often have abstract methods. Here's an example of declaring an abstract class that has an abstract method:
abstract class AbstractContainer {
  // Define constructors, fields, methods
  
  void updateChildren(); // Abstract method
}



// 31.隐式接口, Implicit interfaces
/*
Every class implicitly defines an interface containing all the instance members of the class and of any interfaces it inplements. 
If you want to create a class A that supports class B's API without inheriting B's implementation, class A should implement the B interface. 
*/
// A class implements one or more interfaces by declaring them in an implements clause and then providing the APIs required by the interfaces. 

// A person. The implicit interface contains greet()...
class Person {
  // In the interface, but visible only in this library
  final String _name;

  // Not in the interface, since this is a constructor
  Person(this._name);

  // In the interface
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface
class Impostor implements Person {
  String get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

/*
void main() {
    print(greetBob(Person('Kathy')));
    print(greetBob(Impostor()));
}
*/



// 32.扩展一个类, Extending a class: Use extends to create a subclass, and super to refer to the superclass:
class Television {
  void turnOn() {
    _illminateDisplay();
    _activateIrSensor();
  }
}

class SmartTelevision extends Television {
  void turnOn {
    super.turnOn();
    _bootNetworkInterface();
    _initializeMemory();
    _upgradeApps();
  }
}



// 33.重写类成员, Overrinding members
/*
Subclasses can override instance methods(including operators), getters, and setters. 
You can use the @override annotation to indicate that you are intentionally overriding a member:
*/
class Television {
  set constrast(int value) {}
}

class SmartTelevision extends Television {
  @override
  set contrast(num value) {}
}
/*
An overriding method declaration must match the methods that it overrides in several ways:
1) The return type must be the same type as (or a subtype of) the overridden methods' return type
2) Argument type must be the same
3) The number of positional parameters must be the same
4) A generic method can not override a non-generic one, and a non-generic method can not override a generic one

*/



// 34.noSuchMethod
// To detect or react whenever code attempts to use a non-existent method or instance variable, you can override noSuchMethod():
class A {
  // Unless you override noSuchMethod, using a non-existent member results in a NoSuchMethodError
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' '${invocation.memberName}');
  }
}



// 35.枚举, Enumerated types: often called enumerations or enums, are a special kind of class used to represent a fixed number of constant values 
// Declare an enumerated type using the enum keyword:
enum Color { red, green, blue }

// You can use trailling commas when declaring an enumerated type.
// Each value in an enum has an index getter, which returns the zero-based position of the value in the enum declaration. For example, the first value has index 0, and the second value has index 1. 
assert(Color.red.index == 0);

/*
Enumerated types have the following limits:
You can't subclass, mix in, or implement an enum.
You can't explicitly instantiate an enum
*/



// 36.使用Mixin为类添加功能, Adding features to a class: mixins. Mixins are a way of reusing a class's code in multiple calss hierachies.
// To use a mixin, use the with keyword followed by one or more mixin names. The following example shows two classes that use mixins:
class Musician extends Performer with Musical {
 
}

class Maestro extends Person
    with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
    }

// To implement a mixin, create a class that extends Object and declares no constructors. 
// Unless you want your mixin to be usable as a regular class, use the mixin keyword instead of class
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

/* Sometimes you might want to restrict the types that can use a mixin. For example, the mixin might depend on being able to 
invoke a method that the mixin doesn't define. As the following example shows, you can restrict a mixin's use by using the 'on'
keyword to specify the required superclass:
*/
class Musician {

}
mixin MusicalPerformer on Musician {

}
class SingerDancer extends Musician with MusicalPerformer {

}
// In the preceding code, only classes that extend or implement the Musician class can use the mixin MusicalPerformer
// SingerDancer can mix in MusicalPerformer because SingerDancer extends Musician.



// 37.类变量和方法, Class variables and methods: Use the static keyword to implement class-wide variables and methods
// Static variables (class variables) are useful for class-wide state and constants:
class Queue {
  static const initialCapacity = 16;
  // static variables aren't initialized untill they're used
}

/*
void main() {
  assert(Queue.initialCapacity == 16);
}
*/

/* Static methods(class methods) don't operate on an instance, and thus don' have access to 'this'. 
They do, however, have access to static variables. As the following example shows, you invoke static methods directly on a class.
*/
import 'dart:math';

class Point {
  doubnle x, y;
  Point(this.x, this.y);

  static double distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

/*
void main() {
  var a = Point(2, 2);
  var b = Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  assert(2.8 < distance && distance < 2.9);
  print(distance);
}
*/



// 38.泛型, Generics
/*
The benefits of generics
1) Properly specifying generic types results in better generated code
If you intend for a list to contain only strings, you can declare it as List<String> (read that as "list of string"). 
That way you, your fellow programmers, and your tools can detect that assigning a non-string to the list is probabbly a mistake:

var names = <String>[];
names,addAll(['Seth', 'Kathy', 'Lars']);
names.add(42);  //Error

2) You can use generics to reduce code duplication.
Generics let you share a single interface and implementation between many types, while still taking advantage of static analysis:
For example, say you create an interface for caching an object:

abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}
*/



// 39.库和可见性, Libraries and visibility
/*
The 'import' and 'library' directives can help you create a modular and shareable code base. Libraries not only provide APIs, 
but are a unit of privacy: identifiers that start with an underscore(_) are visible only inside the library. 
Every Dart app is a library, even if it doesn't use a library directive

Using libraries: The only required argument to import is a URI specifying the library. 
For built-in libraries, the URI has the special 'dart:' scheme:
import 'dart:html';
For other libraries, you can use a file system path or the 'package:' scheme:
import 'package:test/test.dart';

Specifying a library prefix: If you import two libraries that have conflicting identifiers, then you can specify a prefix for one 
or both libraries. For example, if library1 and library2 both have an Element class, then you might have code like this:
import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;
// Use Element from lib1
Element element1 = Element();
// Use Element from lib2
lib2.Element element2 = lib2.Element();

Importing only part of library: If you want to use only part of a library, you can selectively import the library. For example:
import 'package:lib1/lib1.dart' show foo; // Import only foo 
import 'package:lib2/lib2.dart' hide foo; // Import all names EXCEPT foo
*/



// 40.生成器, Generators: When you need to lazily produce a sequence of values, consider using a generator function. 
/* Dart has built-in support for two kinds of generator functions:
Synchronous generator: Returns an Iterable object
Asynchronous generator: Returns a Stream object

To implement a synchronous generator function, mark the function body as 'sunc*', and use 'yield' statements to deliver values:
*/
Iterable<int> naturalTo(int n) sync* {
  int k = 0;
  while (k<n) yield k++;
}

// To implement an asynchronous generator function, mark the function body as 'async*', and use yield statements to deliver values:
Stream<int> asynchronousNaturalTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}



// 41.元数据, Metadata
/* Use metadata to give additional information about your code. A metadata annotation begins with the character @,
followed by either a reference to a compile-time constant(such as deprecated) or a call to a constant constructor
*/
class Television {
  /// Use [turnOn] to turn the power on instead
  @Deprecated('Use turnOn instead')
  void activate() {
    turnOn();
  }

  /// Turns the TV's power on
  void turnOn() {}
}

// You can define your own metadata annotations. Here's an example of defining a @Todo annotation that takes two arguments:
library todo;

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}

// And here's an example of using that @Todo annotation:
imort 'todo.dart';

@Todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}
/* Metadata can appear before a library, class, typedef, type parameter, constructor, factory, function, field, parameter, or
variable declaration and before an import or export directive. You can retrieve metadata at runtime using reflection
*/



// 42.注释, Comments
/* Documentation comments: Inside a documentation comment, the analyzer ignores all text unless it is enclosed in brackets(中括号).
Using brackets, you can refer to classes, methods, fields, top-level variables, functions, and parameters. 
The name in brackets are resolved in the lexical scope of of the documented program element.
*/



void main() {
  var number = 42; // Declare and initialize a variable.
// var : To declare a variable without specifying the type
  printInteger(number); // Call a function.

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

  var add2 = makeAdder(2);
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);

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

    print(greetBob(Person('Kathy')));
    print(greetBob(Impostor()));

  assert(Queue.initialCapacity == 16);

  var a = Point(2, 2);
  var b = Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  assert(2.8 < distance && distance < 2.9);
  print(distance);
}



}





