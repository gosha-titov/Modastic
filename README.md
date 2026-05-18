
<img width="1344" height="768" alt="modastic_logo" src="https://github.com/user-attachments/assets/6bec451c-ebbf-48ef-9d26-8d9d9cfaf836" />


# Modastic

A comprehensive collection of **hundreds** of battle-tested Swift extensions that make everyday coding cleaner, safer, and more expressive.

> **Note:** The examples below represent only a small fraction of what Modastic offers. 
The library contains nearly a thousand carefully crafted extensions and utilities.


## Overview

`Modastic` includes dozens of helpful extensions, each with detailed documentation. 
Some are syntactic sugar to improve code readability, while others introduce entirely new functionality. 
All of this is designed so that you can enjoy Swift development.

For me personally, these extensions have become a part of the Swift programming language, and I can't imagine development without this library. 
I still update it and add new features from time to time.


## Highlights

### Collection Power-Ups

```swift
let array = ["Betty", "", "Mia", "Victoria"]
    .removing(where: \.isEmpty)    // ["Betty", "Mia", "Victoria"]
    .setting("Luna", at: 2)        // ["Betty", "Mia", "Luna"]
    .rearranging(from: 2, to: 1)   // ["Betty", "Luna", "Mia"]
    .prepending("Alice")           // ["Alice", "Betty", "Luna", "Mia"]
    .appending("Sophia")           // ["Alice", "Betty", "Luna", "Mia", "Sophia"]
```

### Numeric Utilities

```swift
// Getting percentage rounded to nearest 5% stride
let percentage = 97
    .clamped(to: 0...100)
    .toDouble()             // 97.0
    .divided(by: 5)         // 19.4
    .rounded()              // 19.0
    .toInt()                // 19
    .multiplied(by: 5)      // 95
```

### Key-Path Driven Operations

```swift
struct Todo {
    let title: String, isCompleted: Bool
}

let todos = [
    Todo(title: "Design layout", isCompleted: true),
    Todo(title: "Implement feature", isCompleted: false),
    Todo(title: "Fix bugs", isCompleted: true)
]

todos.forEach(where: \.isCompleted) {
    print("Completed: \($0.title)")
}
// Prints "Completed: Design layout"
// Prints "Completed: Fix bugs"
```

```swift
struct Employee {
    let name: String, age: Int, salary: Int
}

let employees = [
    Employee(name: "Alice", age: 31, salary: 111),
    Employee(name: "James", age: 23, salary: 222),
    Employee(name: "Kevin", age: 57, salary: 333)
]

employees.sorted(by: \.age, using: >)
// Kevin, Alice, James

employees.sorted(by: \.salary)
// Alice, James, Kevin

employees.min(by: \.age)
// James

employees.max(by: \.salary)
// Kevin
```

### Safe Transformations

```swift
// fullMap returns a result only if ALL elements are successfully transformed
let numbers = ["1", "2", "3", "4"]
    .fullMap { Int($0) } // Optional([1, 2, 3, 4])

// Returns nil if any transformation fails
let mixed = ["1", "2", "three", "4"]
    .fullMap { Int($0) } // nil
```

## Explore the Full Library

The examples above are just the tip of the iceberg. 
`Modastic` contains **hundreds** of extensions across dozens of files — and every single one is documented with inline examples.
The best way to discover what `Modastic` can do for you is to **browse the source files directly**. 

Each extension includes clear documentation and usage examples right where it's defined, so you can see exactly how it works and decide what fits your project.

No external docs site required — the code is the documentation.


## Installation

Add `Modastic` via Swift Package Manager:

```
https://github.com/gosha-titov/Modastic.git
```

Or in `Package.swift`:

```swift
dependencies: [
    .package(
        url: "https://github.com/gosha-titov/Modastic.git",
        .upToNextMinor(from: "1.1.0")
    )
]
```
