import Foundation
import Combine

protocol LoginViewModelInputProtocol: AnyObject {
    var loginWelcome: String { get }
    var loginText: String { get }
    var getRegister: String { get }
    var getRegisterText: String { get }
}

final class LoginViewModel: LoginViewModelInputProtocol, ObservableObject {
    var loginWelcome: String = "Welcome !"
    var loginText: String = "Enter your details to log in to your account."
    var getRegister: String = "You do not have an account?"
    var getRegisterText: String = "Sign up"
    
    @Published var username: String = ""
    @Published var password: String = ""

    @Published var isFormValid: Bool = false
    @Published var isLoading: Bool = false
    @Published var error: String?
    @Published var isSuccess: Bool = false

    private let loginManager: LoginManager
    private var cancellables = Set<AnyCancellable>()

    init(loginManager: LoginManager = .shared) {
        self.loginManager = loginManager
        bind()
    }

    private func bind() {
        Publishers.CombineLatest($username, $password)
            .map { username, password in
                username.count > 3 && password.count > 3
            }
            .assign(to: &$isFormValid)
    }

    func login() {
        guard isFormValid else { return }

        isLoading = true
        error = nil

        Task {
            do {
                let response = try await loginManager.login(
                    username: username,
                    password: password
                )

                print("TOKEN:", response.token)
                KeychainService.shared.saveToken(response.token)

                self.isSuccess = true

            } catch {
                self.error = error.localizedDescription
            }

            self.isLoading = false
        }
    }
}

