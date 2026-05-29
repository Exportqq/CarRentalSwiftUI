import Foundation
import Combine

protocol RegisterViewModelInputProtocol: AnyObject {
    var loginWelcome: String { get }
    var loginText: String { get }
    var getRegister: String { get }
    var getRegisterText: String { get }
}

final class RegisterViewModel: RegisterViewModelInputProtocol, ObservableObject {
    var loginWelcome: String = "Welcome !"
    var loginText: String = "Enter the information to  create your account."
    var getRegister: String = "Already have an account?"
    var getRegisterText: String = "Sign in"
    
    @Published var username: String = ""
    @Published var password: String = ""

    @Published var isFormValid: Bool = false
    @Published var isLoading: Bool = false
    @Published var error: String?
    @Published var isSuccess: Bool = false

    private let registerManager: RegisterManager
    private let loginManager: LoginManager
    private var cancellables = Set<AnyCancellable>()

    init(
        registerManager: RegisterManager = .shared,
        loginManager: LoginManager = .shared
    ) {
        self.registerManager = registerManager
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

    func register(loading: LoadingState) {
        guard isFormValid else { return }

        isLoading = true
        error = nil

        Task {
            loading.show()
            do {
                _ = try await registerManager.register(
                    username: username,
                    password: password
                )

                let loginResponse = try await loginManager.login(
                    username: username,
                    password: password
                )

                print("TOKEN:", loginResponse.token)

                KeychainService.shared.saveToken(loginResponse.token)

                self.isSuccess = true

            } catch {
                self.error = error.localizedDescription
            }

            self.isLoading = false
            loading.hide()
        }
    }
}

