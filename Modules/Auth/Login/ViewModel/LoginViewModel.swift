import Foundation

protocol LoginViewModelInputProtocol: AnyObject {
    var loginWelcome: String { get }
    var loginText: String { get }
}

final class LoginViewModel: LoginViewModelInputProtocol {
    var loginWelcome: String = "Welcome !"
    var loginText: String = "Enter the information to  create your account."
}

