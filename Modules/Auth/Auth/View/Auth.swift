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
            
            ZStack(alignment: .top) {
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
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(viewModel.authWelcome)
                        .font(.PoppinsBold(36))
                        .foregroundColor(.textBlack)
                        .padding(.top, 42)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 32)
                    
                    Text(viewModel.authText)
                        .font(.PoppinsRegular(16))
                        .foregroundColor(.textGrey)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 32)
                    
                    HStack(spacing: 16) {
                        CustomButtonView(title: "Sign in", typeFill: true) { }
                        
                        CustomButtonView(title: "Sign up", typeFill: false) { }
                    }
                    .padding(.top, 30)
                    .padding(.horizontal, 32)
                }
            }
            
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
