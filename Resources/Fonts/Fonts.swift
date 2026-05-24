import UIKit
import SwiftUI

extension UIFont {
    
    enum Roboto {
        
        static func regular(_ size: CGFloat) -> UIFont {
            UIFont(name: "Roboto-Regular", size: size)
            ?? UIFont.systemFont(ofSize: size)
        }
        
        static func medium(_ size: CGFloat) -> UIFont {
            UIFont(name: "Roboto-Medium", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .medium)
        }
        
        static func bold(_ size: CGFloat) -> UIFont {
            UIFont(name: "Roboto-Bold", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
    
    enum Poppins {
        
        static func regular(_ size: CGFloat) -> UIFont {
            UIFont(name: "Poppins-Regular", size: size)
            ?? UIFont.systemFont(ofSize: size)
        }
        
        static func medium(_ size: CGFloat) -> UIFont {
            UIFont(name: "Poppins-Medium", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .medium)
        }
        
        static func bold(_ size: CGFloat) -> UIFont {
            UIFont(name: "Poppins-Bold", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .bold)
        }
        
        static func black(_ size: CGFloat) -> UIFont {
            UIFont(name: "Poppins-Black", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
}

extension Font {
    
    static func robotoRegular(_ size: CGFloat) -> Font {
        Font(UIFont.Roboto.regular(size))
    }
    
    static func robotoMedium(_ size: CGFloat) -> Font {
        Font(UIFont.Roboto.medium(size))
    }
    
    static func robotoBold(_ size: CGFloat) -> Font {
        Font(UIFont.Roboto.bold(size))
    }
    
    static func PoppinsRegular(_ size: CGFloat) -> Font {
        Font(UIFont.Poppins.regular(size))
    }
    
    static func PoppinsMedium(_ size: CGFloat) -> Font {
        Font(UIFont.Poppins.medium(size))
    }
    
    static func PoppinsBold(_ size: CGFloat) -> Font {
        Font(UIFont.Poppins.bold(size))
    }
    
    static func PoppinsBlack(_ size: CGFloat) -> Font {
        Font(UIFont.Poppins.black(size))
    }
}
