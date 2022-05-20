import Foundation

class Person {
    var name: String
    var surname: String
    var age: Int
    var type: PersonType
    var gender: Gender?
    var toy: Toy?
    
    init(name: String, surname: String, age: Int, type: PersonType) {
        self.name = name
        self.surname = surname
        self.age = age
        self.type = type
    }
    
}

enum PersonType {
    case kid
    case grown
}
enum Gender {
    case male
    case female
}

struct Toy {
    var name: String
    var type: ToyType
}
enum ToyType {
    case car
    case doll
}
//

