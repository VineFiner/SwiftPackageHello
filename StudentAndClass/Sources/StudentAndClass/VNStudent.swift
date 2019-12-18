//
//  VNStudent.swift
//  StudentAndClass
//
//  Created by vine on 2019/12/18.
//

class VNStudent {
    let name: String
    let age: Int
    let score: Int
    
    init(name: String, age: Int, score: Int) {
        self.name = name
        self.age = age
        self.score = score
    }
}
extension VNStudent: CustomStringConvertible {
    var description: String {
        return "name: \(name)    age: \(age)  score: \(score)"
    }
}
