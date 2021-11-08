/// dart:math
/*
The dart:math library (API reference) provides common functionality such as sine and cosine, maximum and minimum, and constants such as pi and e. 
Most of the functionality in the Math library is implemented as top-level functions.
 */
// To use this library in your app, import dart:math.
import 'dart:math';

// The Math library provides basic trigonometric functions:
// Cosine
assert(cos(pi) == -1.0);
// Sine
var degrees = 30;
var radians = degrees * (pi / 180);
// radians is now 0.52359.
var sinOf30degrees = sin(radians);
// sin 30° = 0.5
assert((sinOf30degrees - 0.5).abs() < 0.01);

// The Math library provides max() and min() methods:
assert(max(1, 1000) == 1000);
assert(min(1, -1000) == -1000);

//Find your favorite constants—pi, e, and more—in the Math library:
// See the Math library for additional constants.
print(e); // 2.718281828459045
print(pi); // 3.141592653589793
print(sqrt2); // 1.4142135623730951

// Random numbers
var random = Random();
random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
random.nextInt(10); // Between 0 and 9.



