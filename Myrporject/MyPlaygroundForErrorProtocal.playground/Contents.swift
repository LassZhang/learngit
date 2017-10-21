//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
enum stringWirteError : Error {
    case contentEmptyError
    case urlEmptyError
    case writeError(error:NSError)
}

func write(content:String ,url:URL) throws {
    
    if content.isEmpty {
        throw stringWirteError.contentEmptyError
    }
    
    if url.absoluteString == nil || url.absoluteString.isEmpty {
        throw stringWirteError.urlEmptyError
    }
    
    
    do {
      try content.write(to: url, atomically: true, encoding: .utf8)

    }
    catch let error as NSError {
        throw stringWirteError.writeError(error: error)
    }
}



// guard
// defer



/**********************扩展和协议****************************/
/**********************1-扩展****************************/
extension String {
    func character(at index:Int) -> Character {
        let index = self.index(self.startIndex, offsetBy: index)
        return self[index]
    }
    subscript(index:Int) ->Character {
        let index = self.index(self.startIndex, offsetBy: index)
        return self[index]
    }
    
    var length:Int {
        get {
            return self.characters.count
        }
    }
}
let dogstring = "dog🐶"

dogstring.character(at: 0)

dogstring.character(at: 3)
dogstring.length
dogstring[3]

/**********************2-协议 -protocol****************************/

// 一个人有不同的角色

protocol Programmer {
    func program() -> Void
}

protocol Father {
    func story() -> Void
}

protocol Son {
    func acompany() -> Void
}
class AMAN : Programmer,Father,Son {
     func program() {
        print("programmer")
    }
    func story(){
      print("story")
    }
    func acompany(){
       print("play")
    }
}






let amam = AMAN()

let programmer :Programmer = amam
programmer.program()
let father :Father = amam
father.story()

let son :Son = amam
son.acompany()

// 通过扩展协议默认实现，从而实现多继承




