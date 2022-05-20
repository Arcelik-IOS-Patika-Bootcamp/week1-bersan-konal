import Foundation

class Person {
    var name: String
    var surname: String
    var type: PersonType
    var gender: Gender
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
            print( "\(person.name) now has a toy!")
        }
        else {
            print("\(person.name) is too old for this :(")
        }
    }
    func displayToys(person: Person) {
        if !toys.isEmpty {
            for toy in toys {
                print("\(person.name) has \(toy.name)")
            }
        }
        else {
            print("\(person.name) has no toys :(")
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
    
    func populate(){
        people.append(Person(name: "Berşan", surname: "Konal", type: .grown, gender: .male))
        people.append(Person(name: "Eric", surname: "Leifsson",  type: .kid, gender: .male))
        people.append(Person(name: "Umay", surname: "Çağırkan", type: .kid, gender: .female))
    }
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
    
}

let population = Population()

population.populate()

population.giveToysToPeople(people: population.people)

for person in population.people {
    person.displayToys(person: person)
}
