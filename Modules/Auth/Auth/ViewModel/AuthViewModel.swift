import Foundation

protocol AuthViewModelInputProtocol: AnyObject {
    var brandName: String { get }
    var authWelcome: String { get }
    var authText: String { get }

}

final class AuthViewModel: AuthViewModelInputProtocol {
    var brandName: String = "CAR RENTAL"
    var authWelcome: String = "Welcome !"
    var authText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et"

}

