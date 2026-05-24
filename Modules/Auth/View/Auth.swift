import SwiftUI

struct Auth: View {
    
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
            
            Rectangle()
                .fill(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: 364)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 33,
                        topTrailingRadius: 33
                    )
                )
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
            
        )
        .background(Color.backClr)
        .ignoresSafeArea()
    }
}

#Preview {
    Auth()
}
