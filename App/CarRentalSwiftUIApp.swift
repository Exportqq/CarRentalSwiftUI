import SwiftUI

@main
struct CarRentalSwiftUIApp: App {
    
    @StateObject private var session = SessionManager.shared
    
    var body: some Scene {
        WindowGroup {
            Group {
                if session.isAuthorized {
                    TabBarController()
                } else {
                    AuthView()
                }
            }
            .onAppear {
                session.checkAuth()
            }
        }
    }
}
