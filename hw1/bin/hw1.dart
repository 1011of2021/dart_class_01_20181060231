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



}