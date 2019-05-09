[创建一个可执行文件](https://swift.org/getting-started/#using-the-package-manager)

包含 `main.swift` 文件的项目，被视为可执行项目。 `Package Manager` 将文件编译成二进制可执行文件.

在这个例子中， `package` 将生成一个名为 `Hello` 的可执行文件, 并输出 "Hello, world!"

* 首先创建并进入一个名为 `Hello` 的文件夹:

```
$ mkdir Hello
$ cd Hello
```

* 现在运行带有类型的 `swift packge` 的init命令:

```
$ swift package init --type executable
```

* 使用 `swift run`命令构建并运行可执行文件e:

```
$ swift run Hello
Compile Swift Module 'Hello' (1 sources)
Linking ./.build/x86_64-apple-macosx10.10/debug/Hello
Hello, world!
```

- Note: 由于此包中只有一个可执行文件，因此我们可以省略 `swift run` 命令中的可执行文件名

- 您还可以通过运行 `swift build`命令编译包，然后从`.build`目录运行二进制文件:

```
$ swift build
Compile Swift Module 'Hello' (1 sources)
Linking ./.build/x86_64-apple-macosx10.10/debug/Hello

$ .build/x86_64-apple-macosx10.10/debug/Hello
Hello, world!
```

- 下一步，让我们在新的资源文件中定义一个新的`sayHello(name :)`函数，并进行可执行调用，而不是直接调用 `print（_ :)`.

#### Working with Multiple Source Files

- 在 `Sources / Hello`目录中创建一个名为`Greeter.swift`的新文件，并输入以下代码:

```
$ touch Sources/Hello/Greeter.swift
$ vim Sources/Hello/Greeter.swift
```
```
func sayHello(name: String) {
    print("Hello, \(name)!")
}
```

- `sayHello（name :)`函数接受一个String参数并打印我们的“Hello”问候语，用函数参数替换单词“World”.

- 现在，再次打开main.swift，并使用以下代码替换现有内容:

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

- 而不是像以前一样使用硬编码名称，`main.swift`现在从命令行参数读取。而不是直接调用`print（_ :)`，`main.swift`现在调用`sayHello（name :)`方法。因为该方法是Hello模块的一部分，所以不需要import语句.

- 运行`swift run`并尝试新版本的`Hello`:

```
$ swift run Hello `whoami`
```

##生成 Xcode 项目

```
swift package generate-xcodeproj
open Hello.xcodeproj 
```