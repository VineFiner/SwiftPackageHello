//
//  VNClass.swift
//  StudentAndClass
//
//  Created by vine on 2019/12/18.
//

#if os(Linux)
import Glibc
#else
import Darwin.C
// 这里是为了可以使用 exit(0)
#endif

// 这里是枚举
enum SortMode {
    case name
    case age
    case score
}
class VNClass {
    
    let className: String
    var students: [String: VNStudent]
    var studentList: [VNStudent]
    
    init(className: String, students: [String: VNStudent], studentsList:[VNStudent]) {
        self.className = className
        self.students = students
        self.studentList = studentsList
    }
    // 这里是便利构造器
    convenience init(name: String) {
        self.init(className: name, students: [:], studentsList: [])
    }
    
    // MARK: function
    func add(student: VNStudent) {
        // 先判断是否存在
        let isExist = students.contains { $0.key == student.name }
        if isExist {
            print("Student is exist!")
        } else {
            students[student.name] = student
        }
    }
    func remove(student: VNStudent) {
        // 先判断是否存在
        let isExist = students.contains { $0.key == student.name }
        if !isExist {
            print("Student not exist!")
        } else {
            guard let index = students.index(forKey: student.name) else { return }
//            students.remove(at: <#T##Dictionary<String, VNStudent>.Index#>)
            students.remove(at: index)
        }
    }
    func student(with name: String) -> VNStudent? {
        return students[name]
    }
    func showStudent() {
        for (index, _) in students {
            print("name: \(index)")
        }
    }
    func showStudentInList() {
        for value in studentList {
            debugPrint(String(describing: value))
        }
    }
    func sortByModel(mode: SortMode) {
        // 获取所有学生
        studentList = students.values.map { $0 }
        // 进行排序
        switch mode {
        case .name:
            studentList.sort { (stu1, stu2) -> Bool in
                stu1.name < stu2.name
            }
        case .age:
            studentList.sort { (stu1, stu2) -> Bool in
                stu1.age < stu2.age
            }
        case .score:
            studentList.sort { (stu1, stu2) -> Bool in
                stu1.score < stu2.score
            }
        }
    }
    // MARK: test
    // static 不能继承
    // class 方法可以继承
    static func test() {
        // 创建一个实例类
        let sunshineClass = VNClass(name: "sunshine")
        // 创建学生
        for value in 0..<5 {
            let name = "stu\(value)"
            
            #if os(Linux)
            let age = Int(random() % 20) + 5
            let score = Int(random() % 100) + 5
            #else
            let age = Int(arc4random_uniform(UInt32(20))) + 5
            let score = Int(arc4random_uniform(UInt32(100))) + 5
            #endif
            
            // 创建学生
            let stu = VNStudent(name: name, age: age, score: score)
            // 加入班级
            sunshineClass.students[name] = stu
        }
        
        while true {
            let detail = """


*****************
1、Show All student
2、Add a student
3、Remove a student
4、Find student Info
5、Sort By Age
6、Sort By Name
7、Sort By Score
8、Exit


"""
            print(detail)
            
            guard let line = readLine() else { return }
            let number = Int(line)
            
            switch number {
            case 1:
                sunshineClass.showStudent()
            case 2:
                print("Please input student`s name:\n")
                guard let stuName = readLine() else {
                    return
                }
                print("Please input student`s age:\n")
                guard let stuAge = readLine() else {
                    return
                }
                print("Please input student`s score:\n")
                guard let stuScore = readLine() else {
                    return
                }
                let newStu = VNStudent(name: stuName, age: Int(stuAge) ?? 0, score: Int(stuScore) ?? 0)
                sunshineClass.add(student: newStu)
            case 3:
                print("Please input student`s name:\n")
                guard let stuName = readLine() else {
                    return
                }
                let newStu = VNStudent(name: stuName, age: 0, score: 0)
                sunshineClass.remove(student: newStu)
            case 4:
                print("Please input student`s name:\n")
                guard let stuName = readLine() else {
                    return
                }
                let newStu = sunshineClass.student(with: stuName)
                print(String(describing: newStu))
            case 5:
                sunshineClass.sortByModel(mode: .age)
                sunshineClass.showStudentInList()
            case 6:
                sunshineClass.sortByModel(mode: .name)
                sunshineClass.showStudentInList()
            case 7:
                sunshineClass.sortByModel(mode: .score)
                sunshineClass.showStudentInList()
            case 8:
                print("See you next time")
                exit(0)
            default:
                print("Input error")
            }
        }
    }
}
