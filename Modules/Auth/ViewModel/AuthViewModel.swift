import Foundation

protocol AuthViewModelInputProtocol: AnyObject {
    var brandName: String { get }
}

final class AuthViewModel: AuthViewModelInputProtocol {
    var brandName: String = "CAR RENTAL"
}

