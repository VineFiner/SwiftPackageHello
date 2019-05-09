[中文](README_CN.md)

[Using the Package Manager](https://swift.org/getting-started/#using-the-package-manager)

A target is considered as an executable if it contains a file named main.swift. The package manager will compile that file into a binary executable.

In this example, the package will produce an executable named Hello that outputs “Hello, world!”.

* First create and enter a directory called Hello:

```
$ mkdir Hello
$ cd Hello
```

* Now run the swift package’s init command with executable type:

```
$ swift package init --type executable
```

* Use the swift run command to build and run the executable:

```
$ swift run Hello
Compile Swift Module 'Hello' (1 sources)
Linking ./.build/x86_64-apple-macosx10.10/debug/Hello
Hello, world!
```

- Note: Since there is only one executable in this package, we can omit the executable name from the swift run command.

- You can also compile the package by running the swift build command and then run the binary from .build directory:

```
$ swift build
Compile Swift Module 'Hello' (1 sources)
Linking ./.build/x86_64-apple-macosx10.10/debug/Hello

$ .build/x86_64-apple-macosx10.10/debug/Hello
Hello, world!
```

- As a next step, let’s define a new sayHello(name:) function in a new source file, and have the executable call that instead of calling print(_:) directly.

#### Working with Multiple Source Files

- Create a new file in the Sources/Hello directory called Greeter.swift, and enter the following code:

```
$ touch Sources/Hello/Greeter.swift
$ vim Sources/Hello/Greeter.swift
```
```
func sayHello(name: String) {
    print("Hello, \(name)!")
}
```

- The sayHello(name:) function takes a single String argument and prints our “Hello” greeting before, substituting the word “World” with the function argument.

- Now, open main.swift again, and replace the existing contents with the following code:

```
vim Sources/Hello/main.swift  
```

```
if CommandLine.arguments.count != 2 {
    print("Usage: hello NAME")
} else {
    let name = CommandLine.arguments[1]
    sayHello(name: name)
}
```

- Rather than using a hardcoded name as before, main.swift now reads from the command line arguments. And instead of invoking print(_:) directly, main.swift now calls the sayHello(name:) method. Because the method is part of the Hello module, no import statement is necessary.

- Run swift run and try out the new version of Hello:

```
$ swift run Hello `whoami`
```

## generate  Xcode Project

```
swift package generate-xcodeproj
open Hello.xcodeproj 
```



