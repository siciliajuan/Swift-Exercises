
//: Playground - noun: a place where people can play

import Cocoa


//enum TextAlignment {
//    case Left
//    case Right
//    case Center
//}
//
//var alignment /*: TextAlignment */= TextAlignment.Left
//
//alignment = .Right
//
//if alignment == .Right {
//    print("We should right-align the page")
//}
//
//switch alignment {
//case .Right:
//    print("Right aligned")
//case .Left:
//    print("Right right")
//case .Center:
//    print("Right center")
//}


//enum TextAlignment: Int {
//    case Right
//    case Left
//    case Center
//    case JustifY
//}
//
//print("El rawValue de TextAlignment.Right es: \(TextAlignment.Right.rawValue)")
//print("El rawValue de TextAlignment.Right es: \(TextAlignment.Left.rawValue)")
//print("El rawValue de TextAlignment.Right es: \(TextAlignment.Center.rawValue)")
//print("El rawValue de TextAlignment.Right es: \(TextAlignment.JustifY.rawValue)")




enum TextAlignment: Int {
    case Right = 20
    case Left = 30
    case Center = 40
    case JustifY = 50
}

print("El rawValue de TextAlignment.Right es: \(TextAlignment.Right.rawValue)")
print("El rawValue de TextAlignment.Right es: \(TextAlignment.Left.rawValue)")
print("El rawValue de TextAlignment.Right es: \(TextAlignment.Center.rawValue)")
print("El rawValue de TextAlignment.Right es: \(TextAlignment.JustifY.rawValue)")



var myAlignment = TextAlignment(rawValue: 40)!
print(myAlignment)



enum EnumTest {
    case Point
    case Cuadrado (Double)
    case Rectangle (ancho: Double, largo: Double)
    
    func calcaleArea() {
        switch self {
        case .Point:
            print(0)
        case let .Cuadrado(side):
            print(side*side)
        case .Rectangle(ancho: Double, largo: <#T##Double#>):
            print(ancho*largo)
        }
        
    }
}

