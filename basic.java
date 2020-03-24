/*Basics*/
/* textbook url:https://joshhug.gitbooks.io/hug61b/content/chap1/chap12.html */ 



/* Hello.java - javac(compiler) - Hello.class - java(Interpreter) - Stuff
Q: Why make a class file at all?
1. .class file has been checked, distributed code is safer.
2. .class file are simpler for machine to execute.
3. Protect your intellectual property.*/

/* HELLO WORLD: all codes must live inside a class */
public class HelloWorld {
  public static void main(string[] args) {
    System.out.println("hello world");
  }
}


/* VARIABLES:
1. Class name should be the same as the flie name when using "public"
2. Java variable type can never be changed
3. Types are verified before the code even run */
public class HelloNumbers{
    public static void main(String[] args){
        int x = 0;
        while (x < 10){
            System.out.println(x);
            x = x + 1;
        }
    }
}

/* TYPES:
8 primitive data types in Java:
1. byte
2. short
3. int
4. long
5. float
6. double 
7. boolean
8. char */

/*REFERENCE VARIABLE DECLARATION:
1. There are 2 varieties of data types in Java, primitive and reference type.
2. When we declare a variable of any reference type, Java allocates a box of 64 bits, no matter what type of object.
3. The 64 bit box contains not the data about the walrus, but instead the address of the Walrus in memory.*/
*****************
Walrus someWalrus;  //creates a box of 64 bits
someWalrus = new Walrus(1000, 8.3); //creates a new Walrus, and the address is returned by the new operator, stored in the box
*****************
//example1: "a" will be changed
public class puzzle{
    public static void main(String[] args){
        Walrus a = new Walrus(1000, 8.3);
        Walrus b;
        b = a;
        b.weight = 5;
        System.out.println(a);
        System.out.println(b);

        int x = 5;
        int y;
        y = x;
        x = 2;
        System.out.println("x is: " + x);
        System.out.println("y is: " + y);
    }
}
*****************
//example2: "walrus" will be changed, "x" do not. 
public class PassByValueFigure {
    public static void main(String[] args) {
           Walrus walrus = new Walrus(3500, 10.5);
           int x = 9;

           doStuff(walrus, x);
           System.out.println(walrus);
           System.out.println(x);
    }
    public static void doStuff(Walrus W, int x) {
           W.weight = W.weight - 100;
           x = x - 5;
    }
    public static class Walrus {
      public double weight;                  //class content 1
      public double height;                  //class content 2
      public Walrus(double w, double h){     //constructor: enable input
         weight = w;
         height = h;
      }
   }
}



/* DEFINE FUNCTIONS:
1. functions must be a part of class, which is called "METHOD"
2. Main function is required definitely
3. "public static" is one way to define funtions (other ways exist later)*/
public class larger{
    public static int larger(int x, int y){
        if(x < y){
            return y;
        }
        return x;
    }
    public static void main(String[] args){
        System.out.println(larger(1,2));
    }
}


/* CLASS:
1. To run a file, must include MAIN method, however, compilation can be done without it
2. Method from other classes can be borrowed by using "." notation
3. Still, everything needs to be included in a "CLASS".
4. File 1 create a class and method, File 2 borrows the method.*/
public class DOG{
    public void dognoise(){
        System.out.println("bark!");
    }
}
public class MAKE{
    public static void main(String[] args){
        DOG.dognoise();
    }
}


/* OBJECT:
1. An Object in Java is an instance of any class!! Classes can contain not just methods, but also DATA(OBJECT)
2. Instance variable / Non-variable
3. Instance method / Non-static method
*/


/*****************[1] Static Version*/
public class DOG{
    public static void dognoise(int weight){
        if(weight < 10){
            System.out.println("yip!");
        }
        else if(weight < 30){
            System.out.println("wooof!");
        }
        else {
            System.out.println("bark!");
        }
    }
}
public class MAKE{
    public static void main(String[] args){
        DOG.dognoise(9);
    }
}


/*****************[2] Non-Static Version*/
public class DOG{
    public int weight;
    public DOG(int w){                /* known as "Constructor", pass input for later use */
        weight = w;
    }
    public void dognoise(){           /* here deletes the "static" */
        if(weight < 10){
            System.out.println("yip!");
        }
        else if(weight < 30){
            System.out.println("wooof!");
        }
        else {
            System.out.println("bark!");
        }
    }
}
public class MAKE{
    public static void main(String[] args){
        DOG d = new DOG(9);
        d.dognoise();
    }
}


/* ARRAY */
//1. A variable of array type holds a reference to an object*/
int[] x;
Planet[] planets;

//2. Instantiate an array
int[] x = new int[]{0, 1, 2, 95, 4};
                                    /*TIPS:
                                      - creating 64 bit box for storing an int array address.(Declaration)
                                      - cearting a new object, in this case an int array.(Instantiation)
                                      - Put the address of the new object into the 64 bit box.(Assignment)
                                      - Instantiated objects can be lost if reassigning to something else.

//example: First, use the keyword to create an array that can hold 2 objects.
//Then use new again for each object you want to put in the array.*/
DOG[] dogs = new DOG[2];
dogs[0] = new DOG(9);
dogs[1] = new DOG(19);
dogs[0].dognoise();

/** Arrays are s special kind of object which consists of a numbered sequence of memory boxes.
1. To get ith item of array A, use A[i]
2. A fixted integer length
3. Same type of value
4. All numbered 0 through length-1
5. It's a reference variable
6. It's like a class that has instance variables(like x.length)
 */

// create array containing 3 int boxes, each container gets a default value
y = new int[3];
// ceaate array containing 1,2,3,4,5 integers
x = new int[]{1,2,3,4,5}
// can omit the new of also declaring a variable
int[] w = {9,10,11,12,13}


/** 2D ARRAY */
//create an array of arraies
int[][] x;
//create an array of 4 arraies, each one has default value (null)
test = new int[4][];
//assign value to each array
test[0] = new int[]{1};
test[1] = new int[]{1,2};
test[3] = new int[]{1,2,3};
//declare 2D array and assign value
int[][] matrix = new int[][]{{1},{1,2},{1,2,3}};

/** 
 *  2D Array
 */

public class ArrayDanger {

    public static void main(String[] args) {
        int[][] x = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

        int[][] z = new int[3][];
        z[0] = x[0];
        z[1] = x[1];
        z[2] = x[2];
        z[0][0] = -z[0][0];

        int[][] w = new int[3][3];
        System.arraycopy(x[0], 0, w[0], 0, 3);
        System.arraycopy(x[1], 0, w[1], 0, 3);
        System.arraycopy(x[2], 0, w[2], 0, 3);
        w[0][0] = -w[0][0];
        System.out.println("x[0][0]: " + x[0][0] + ", w[0][0]: " + w[0][0]);
    }    
} 




/* STATIC VS NON-STATIC METHOD
1. Static Method (a.k.a Class Method):
are invoked using the class name!!!!

2. Non-Static Method (a.k.a Instance Method):
are invoked using an instance name!!!!


/*****************[1] Implement maxDog as a Static Method*/
public static Dog maxDog(Dog d1, Dog d2) {
    if (d1.weightInPounds > d2.weightInPounds) {           /*In this class, we have both instance and static methods*/ 
        return d1;
    }
    return d2;
}
Dog d = new Dog(15);
Dog d2 = new Dog(100);
Dog.maxDog(d, d2);


/*****************[2] Implement maxDog as a Non-Static Method*/
public Dog maxDog(Dog d2) {
    if (this.weightInPounds > d2.weightInPounds) {
        return this;
    }
    return d2;
}
Dog d = new Dog(15);
Dog d2 = new Dog(100);
d.maxDog(d2);

          /* NOTICE:
          1. A variable or method defined in a class is also called a member of that class(a.k.a object)
          2. Static members are accessed using class name
          3. Non-static members cannot be invoked using class name
          4. Static methods should access instance variables via a special instance. e.g. d1*/ 



/* STATIC VS NON-STATIC VARIABLE:
1. Static variables should be accessed using the name of the class rather than a specific instance.
2. Every Static variable has same value when being accessed. */
public class Dog {
    public int weightInPounds;
    public static String binomen = "Canis familiaris";
    ...
}


/* COMMAND LINE:
1. String[] args means creating an array of String called args*/
public class argsdemo{
    public static void main(String[] args){
        int N = args.length;
        int i = 0;
        int sum = 0;
        while(i < N){
            sum = sum + Integer.parseInt(args[i]);
            i = i + 1;
        }
        System.out.println(sum);
    }
}


/* LIBRARY:
1. Java Library
2. The Princeton Standard Library: http://introcs.cs.princeton.edu/java/stdlib/
3. Community*/


/* CONSTRUCTOR:
To initalize an instance of the class,and it's like creating an access to place INPUT for the class.
IN SHORT: for "new", initialize new content.


/* PUBLIC & PRIVATE & NESTED CLASS (See codes at SLList.java)
1. Private variables and methods, or constructors can only be accessed by code inside the same .java file (ATTENTION HERE)
2. It's a simple way to signal other programmers you should not use this, and soft restriction by the compiler so you cannot mess with it
3. A nested class which is STATIC can't access any of the outer class's stuff.

Why use PRIVATE to restrict access?
Hide implementation details from users of your class:
                1. Less for user of class to understand.
                2. Safe for you to change private methods (implementation).
                
 
 
 

/* MEMORY:
/** give a memory box of 32 bits that stores ints */
int x;

/** give a memory box of 64 bits that stores Walrus reference */
Walrus w1;

/** give a memory box of 64 bits that stores Walrus references and also give us 96 bits for storing the int size(32 bits)
 and double tuskSize(64 bits) of our Walrus */
Walrus w2 = new Walrus(30, 5.6);





