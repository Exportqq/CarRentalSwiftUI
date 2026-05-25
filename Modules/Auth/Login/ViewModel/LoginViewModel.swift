import Foundation

protocol LoginViewModelInputProtocol: AnyObject {
    var loginWelcome: String { get }
    var loginText: String { get }
    var getRegister: String { get }
    var getRegisterText: String { get }
}

final class LoginViewModel: LoginViewModelInputProtocol {
    var loginWelcome: String = "Welcome !"
    var loginText: String = "Enter your details to log in to your account."
    var getRegister: String = "You do not have an account?"
    var getRegisterText: String = "Sign up"
}

