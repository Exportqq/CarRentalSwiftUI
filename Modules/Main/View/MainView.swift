import SwiftUI

struct MainView: View {
    
    private let viewModel = AuthViewModel()
    
    var body: some View {
        VStack() {
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 105, height: 70)
                .padding(.top, 211)
            
            Text(viewModel.brandName)
                .font(.PoppinsBold(20))
                .foregroundColor(.textGrey)
            
            Spacer()
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

