import Foundation

class Person {
    let name: String
    var surname: String?
    let type: PersonType
    let gender: Gender
    var phoneNumber: Int?
    var toys: [Toy] = []
    
    
    init(name: String, type: PersonType,gender: Gender) {
        self.name = name
        self.type = type
        self.gender = gender
       
    }
    //function that checks whether a person can have a toy.
    func canHaveToy(person: Person) -> Bool {
        switch person.type {
        case .child:
            return true
        case .adult:
            return false
        }
    }
    func giveToy(person: Person, toy: Toy)  {
        if canHaveToy(person: person) {
            toys.append(toy)
        }
    }
    func isSurnameSpecified() {
        guard let surname = surname else {
            return
        }
        print(surname)
    }
    
}

enum PersonType {
    case child
    case adult
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

class Population {
    var people: [Person] = []
    
    
    func giveToysToPeople(people: [Person]) {
        for person in people {
            if person.gender == .male {
                person.giveToy(person: person, toy: Toy(name: "Ferrari", type: .car))
                person.giveToy(person: person, toy: Toy(name: "BMW", type: .car))
            }
            else {
                person.giveToy(person: person, toy: Toy(name: "Barbie", type: .doll))
                person.giveToy(person: person, toy: Toy(name: "Winx", type: .doll))
            }
        }
    }
    func displayToys(people: [Person]) {
        for person in people {
            if !person.toys.isEmpty {
                for toy in person.toys {
                    print("\(person.name) has a toy named \(toy.name)")
                }
            }
            else {
                print("\(person.name) is too old to play with toys :(")
            }
        }
        
    }
    func displayPhoneNumbers(people: [Person]) {
        for person in people {
            if let phoneNumber = person.phoneNumber {
                print("\(person.name)'s phone number: \(phoneNumber)")
            }
        }
        
    }
    
    
}

let population = Population()
let bersan = Person(name: "Berşan", type: .adult, gender: .male)
bersan.phoneNumber = 213123145
bersan.surname = "Konal"
let yavuz = Person(name: "Yavuz", type: .child, gender: .male)
let umay = Person(name: "Umay", type: .child, gender: .female)
let aslihan = Person(name: "Aslıhan", type: .adult, gender: .female)
aslihan.phoneNumber = 314314153
population.people.append(bersan)
population.people.append(yavuz)
population.people.append(umay)
population.people.append(aslihan)


population.giveToysToPeople(people: population.people)
population.displayToys(people: population.people)
population.displayPhoneNumbers(people: population.people)

bersan.isSurnameSpecified()
aslihan.isSurnameSpecified()
