import Foundation
import Combine

protocol ProfileViewModelInputProtocol: AnyObject {
    var user: ProfileModel? { get }
    var userPublisher: Published<ProfileModel?>.Publisher { get }
}

final class ProfileViewModel: ProfileViewModelInputProtocol, ObservableObject {
    
    @Published private(set) var user: ProfileModel?
    @Published var isLoading: Bool = false
    
    var userPublisher: Published<ProfileModel?>.Publisher { $user }
    
    @MainActor
    func fetchProfile() async throws -> ProfileModel {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let result: ProfileModel = try await ApiClient.shared.request(
                "\(APIConstants.baseURL)/profile",
                method: .get
            )
            self.user = result
            return result
        } catch {
            print("Error profile: \(error)")
            throw error 
        }
    }
}
