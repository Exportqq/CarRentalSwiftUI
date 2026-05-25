import Foundation

protocol RegisterViewModelInputProtocol: AnyObject {
    var loginWelcome: String { get }
    var loginText: String { get }
    var getRegister: String { get }
    var getRegisterText: String { get }
}

final class RegisterViewModel: RegisterViewModelInputProtocol {
    var loginWelcome: String = "Welcome !"
    var loginText: String = "Enter the information to  create your account."
    var getRegister: String = "Already have an account?"
    var getRegisterText: String = "Sign in"
}

