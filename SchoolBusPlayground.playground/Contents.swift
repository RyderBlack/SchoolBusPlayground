/*: 
⬇️ *Vous pouvez ignorez le code ci-dessous, il nous permet juste d'initialiser et de visualiser le canvas à droite.*
 */
import PlaygroundSupport
let canvas = Canvas()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = canvas

class Bus {
    
    init(driverName: String) {
        self.driverName = driverName
    }
    var driverName: String
    var seats = 20
    var occupiedSeats = 0
    
    let numberOfWheel = 4
    
    
    func moveForward() {
        canvas.moveBusForward()
    }
    
    func stop() {
        canvas.stopBus()
    }
    
    func drive(road: Road) {
        for _ in road.sections {
            moveForward()
        }
    }
}


class SchoolBus: Bus {
    var schoolName = ""
}

var unBusScolaire = SchoolBus(driverName: "Jean")
unBusScolaire.seats = 40
unBusScolaire.moveForward()

enum RoadSectionType {
    case plain
    case home
    case school
}

class RoadSection {
    
    var type: RoadSectionType

    init(type: RoadSectionType) {
        self.type = type
        switch type {
        case .plain:
            canvas.createRoadSection()
        case .home:
            canvas.createHomeRoadSection()
        case .school:
            canvas.createSchoolRoadSection()
        }
    }
}


class Road {
    static let maxLength = 77
    var sections = [RoadSection]()
    
    init(length: Int) {
        var length = length
        if length > Road.maxLength {
            length = Road.maxLength
        }
        for _ in 0..<length {
            self.sections.append(RoadSection())
        }
    }
}

class HomeRoadSection: RoadSection {
    var children: Int
    init(children: Int) {
        self.children = children
        super.init(type: .home)
    }
}

class SchoolRoadSection: RoadSection {
    init() {
        super.init(type: .school)
    }
}


var road = Road(length: 30) // Vous devriez voir une route de 20 sections se dessiner sur le canevas.
var unBus = Bus(driverName: "Jean")
unBus.drive(road: road) // Le bus avance jusqu'au bout de la route

/*:
 - - -
 # Découverte du canevas
 Le canevas, c'est l'étendue de pelouse verte qui se trouve sur la droite 🌿.
 Sur ce canevas, nous allons pouvoir dessiner notre route. Et nous allons faire cela en utilisant les fonctions proposées par le canevas :
 ## Route

 `canvas.createRoadSection()`
 - 🛣 Cette fonction permet de **créer une section de route**. A chaque appel de cette fonction, une nouvelle section de route est crée.

 `canvas.createHomeRoadSection()`
 - 🛣🏠 Similaire à la précédente, cette fonction permet de créer une section de route **qui contient une maison**.

 `canvas.createSchoolRoadSection()`
 - 🛣🏫 Similaire à la précédente, cette fonction permet de créer une section de route **qui contient une école**.

 ## Bus
 `canvas.moveBusForward()`

 - 🚌➡️ Cette fonction permet de faire avancer le bus jusqu'à la section de route suivante. Attention, le bus ne peut pas avancer s'il n'y a plus de route devant lui.

 `canvas.stopBus()`
 - 🚌🛑 Cette fonction permet de faire marquer un arrêt au bus.

 ## A vous de jouer !
 */

