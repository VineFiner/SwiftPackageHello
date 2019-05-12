import Say

print("Hello, world!")

// command line argument

/*
 swift run Hello Tom
 
 Hello, Tom!
 */
if CommandLine.arguments.count != 2 {
    print("Usage: hello NAME")
} else {
    let name = CommandLine.arguments[1]
    sayHello(name: name)
}
