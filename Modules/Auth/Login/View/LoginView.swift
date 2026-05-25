import SwiftUI

struct LoginView: View {
    
    private let viewModel = LoginViewModel()
    @Environment(\.dismiss) private var dismiss
    var onSignUp: (() -> Void)? // ← добавь

    @State private var fullName = ""
    @State private var password = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                dismiss()
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    
                    Image("arrow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.horizontal, 32)

            Spacer()
            
            VStack(alignment: .leading, spacing: 37) {
                VStack(alignment: .leading) {
                    Text(viewModel.loginWelcome)
                        .font(.PoppinsBold(36))
                        .foregroundColor(.textBlack)
                    
                    Text(viewModel.loginText)
                        .font(.PoppinsRegular(16))
                        .foregroundColor(.textGrey)
                }
                .padding(.horizontal, 32)

                
                ZStack(alignment: .top) {
                    Rectangle()
                        .fill(Color.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .frame(height: 364)
                        .clipShape(
                            UnevenRoundedRectangle(
                                topLeadingRadius: 33,
                                topTrailingRadius: 33
                            )
                        )
                    
                    VStack(alignment: .leading, spacing: 16) {
                        CustomTextField(placeholder: "Full name", text: $fullName)
                        
                        CustomTextField(placeholder: "Password", text: $password)
                        
                        CustomButtonView(title: "Sign in", typeFill: true) {
                            
                        }
                        
                        HStack(alignment: .center) {
                            Text(viewModel.getRegister)
                                .font(.PoppinsRegular(16))
                                .foregroundColor(.textGrey)
                            
                            Button {
                                dismiss()        
                                onSignUp?()
                            } label: {
                                Text(viewModel.getRegisterText)
                                    .font(.PoppinsRegular(16))
                                    .foregroundColor(.brandClr)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .center)

                    }
                    
                    .padding(.horizontal, 32)
                    .padding(.top, 62)
                }
            }
        }
        .padding(.top, 80)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.backClr)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}

