// Define a function.
void printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
  // $: Similar to pointer, address
}


// This is where the app starts executing.
void main() {
  var number = 42; // Declare and initialize a variable.
//var : To declare a variable without specifying the type
  printInteger(number); // Call a function.
  

//Object: If an object isn't restricted to a single type, specify the Object type
  var name = 'Bob';
  Object name = 'Bob';
  String name = 'Bob';


//Assert: In normal time, code ignores the assert(condition) call. Assert throws an exception if the condition is false 
  int? lineCount;
  assert(lineCount == null);


//late: When you're sure that a variable is set before it's used, but dart disagrees, you can fix it by marking the variable as late
  late description
  description = 'Feijoada!';
  print(description);


//Lazy initializing: When the variable might not be needed, used lazily intitializing will be handy.
  late String temperature = _readThermometer 


//final 
  final name = 'Bob';
  final String nickname = 'Bobby'; //With a type annotation
  //name = 'Alice' (x). A final variable can be only set once. 


//const: A const variable means it's a compile-time constant. If the const variable is at the class level, mark it static const
  const bar = 1000000;
  const double atm = 1.01325 * bar;


//The const keyword can also be used to create constant values. 
  var foo = const[];
  const baz = [];
//foo = [1,2,3];//(√) You can change the value of a non-final, non-const variable, even if it used to have a const value
//baz = [42];(x) Cuz const variables can't be assigned a value.  


//'is' is for typechecks, and 'as' is for typecasts
const list = [i as int]; //typecast
const map = {if (i is int) i: 'int'}; //use 'is' as typecheck and collection if


//There are two variables that represent numbers, int and double. num is a variable that is the superclass of int and double
num x = 1;// x can have both int and double values
double z = 1;// equivalent to double z = 1.0, intengers will be converted automatically to doubles when necessary


//bitwise operation
//shift: assert((3 << 1) == 6)// 0011  ->  0110  
//OR: assert((3 | 4) == 7)// 0011 | 0100 ==0111


//strings
var s1 = 'Single quotes work well for string literals.';
var s2 = 'Double quotes work just as well.';
var s3 = 'It\'s easy to escape the string delimiter.';//which means you can use a '\' before a single quotes to avoid the ambiguity.
var s4 = "It's even easier to use the other delimiter."; //while in the sentences of double quotes, '\' is not necessary.


//expressions: use ${expression} to put the value of an expression inside a string, if the expression is an identifier, you can skip the '{}'
var s = 'string interpolation';
assert('Dart has $s, which is very handy.' //this is equivelant to 'Dart has string interpolation, which is very handy.')
assert('That deserves all caps. ${s.toUpperCase()} is very handy!' //euivelant to 'That deserves all caps. STRING INTERPOLATION is very handy!')


//use '+' to connect multiple strings
var s = 'The + operator ' + 'works, as well.';
assert(s == 'The + operator works, as well.');


//multi-line strings
var s1 = '''
You can create
multi-line strings like this one.
''';
var s2 = """This is also a 
multi-line string.""";


//raw string: You can create a "raw" string by prefixing it with r add a prefix "r". 
var s = r'In a raw string, nothing will be treat specially, not even \n gets special treatment, '\n' will be output instead of wrap. '


//bool: you can't use code like  "if(nonbooleanValue)" or"assert(nonbooleanValue)", instead, explicitly check for values
//Check for an empty string
var fullName = '';
assert(fullName.isEmpty);
//Check for zero
var hitPoints = 0;
assert(hitPoints <= 0);
//Check for null
var unicorn;
assert(unicorn == null);
//Check for NaN
var iMeantToDoThis = 0 / 0;
assert(iMeantToDoThis.isNaN);


//Lists
var list = [1, 2, 3];
//list has type list<int>.If you try to add non-integer objects to this list, the analyzer or runtime raises an error
var constantList = const [1, 2, 3];
//constantList[1] = 1; //This line will cause an error, because it's a compile-time constant
//spread operator(...)
var list = [1, 2, 3];
var list2 = [0, ...list];
assert(list2.length == 4);
//if the right of the spread operator might be null, you can avoid exceptions by using a null-aware spread operator(...?)
var list;
var list2 = [0, ...?list];
assert(list2.length = 1);
//collection if
var nav = [
  'Home',
  'Furniture',
  'Plants',
  if (promoActive) 'Outlet'//outlet will be created if the condition is true
] 
//collection for
var listOfInts = [1, 2, 3];
var listOfStrings = [
  '#0',
  for (var i in listOfInts) '#$i'
];
assert(listOfStrings[1] == '#1');


//Sets: a set in dart is an unordered collection of unique items
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
//to create an empty set, use{} preceded by a type argument, or assign {} to a variable of type Set
var names = <String>{};
//Set<Strings> names = {}; //This works too
//var names = {}; //this is a map, not a set

//add(), addAll()
var elements = <String>{};
elements.add('fluorine');
elements.addAll(halogens);
assert(elements.length == 5);


//Maps
 

}