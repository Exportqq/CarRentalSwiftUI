import SwiftUI

struct AuthView: View {
    
    private let viewModel = AuthViewModel()
    
    @State private var navigateToSignIn = false
    @State private var navigateToSignUp = false
    
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
                        CustomButtonView(title: "Sign in", typeFill: true) {
                            navigateToSignIn = true
                        }
                        
                        CustomButtonView(title: "Sign up", typeFill: false) {
                            navigateToSignUp = true
                        }
                    }
                    .padding(.top, 30)
                    .padding(.horizontal, 32)
                }
            }
            .navigationDestination(isPresented: $navigateToSignIn) {
                LoginView(onSignUp: {
                    navigateToSignIn = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        navigateToSignUp = true
                    }
                })
            }

            .navigationDestination(isPresented: $navigateToSignUp) {
                RegisterView(onSignIn: {
                    navigateToSignUp = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        navigateToSignIn = true
                    }
                })
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
        AuthView()
    }
}
