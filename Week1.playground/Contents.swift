import Foundation

class Person {
    var name: String
    var surname: String
    var type: PersonType
    var gender: Gender
    var phoneNumber: Int?
    var toys: [Toy] = []
    
    
    init(name: String, surname: String, type: PersonType,gender: Gender) {
        self.name = name
        self.surname = surname
        self.type = type
        self.gender = gender
       
    }
    func canHaveToy(person: Person) -> Bool {
        switch person.type {
        case .kid:
            return true
        case .grown:
            return false
        }
    }
    func giveToy(person: Person, toy: Toy)  {
        if canHaveToy(person: person) {
            toys.append(toy)
        }
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
                    print("\(person.name) has \(toy.name)")
                }
            }
            else {
                print("\(person.name) has no toys :(")
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
var bersan = Person(name: "Berşan", surname: "Konal", type: .grown, gender: .male)
bersan.phoneNumber = 213123145
var eric = Person(name: "Eric", surname: "Leifsson",  type: .kid, gender: .male)
var umay = Person(name: "Umay", surname: "Çağırkan", type: .kid, gender: .female)
population.people.append(bersan)
population.people.append(eric)
population.people.append(umay)


population.giveToysToPeople(people: population.people)

population.displayToys(people: population.people)
population.displayPhoneNumbers(people: population.people)
