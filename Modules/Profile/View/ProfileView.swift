import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack() {
            
            ZStack() {
                Rectangle()
                    .foregroundColor(.brandClr)
                    .frame(maxWidth: .infinity, maxHeight: 280)
                    .clipShape(
                        UnevenRoundedRectangle(
                            bottomLeadingRadius: 33,
                            bottomTrailingRadius: 33
                        )
                    )
                
                Text(viewModel.user?.username ?? "")
                    .font(Font.PoppinsBold(20))
                    .foregroundColor(.white)
            }
            
            VStack() {
                CustomButtonView(
                    title: "Logout",
                    typeFill: true
                ) {
                    SessionManager.shared.logout()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.backClr)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}

