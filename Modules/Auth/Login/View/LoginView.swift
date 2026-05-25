import SwiftUI

struct LoginView: View {
    
    private let viewModel = AuthViewModel()
    @Environment(\.dismiss) private var dismiss
    
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
            
            VStack(spacing: 37) {
                VStack(alignment: .leading) {
                    Text(viewModel.authWelcome)
                        .font(.PoppinsBold(36))
                        .foregroundColor(.textBlack)
                    
                    Text(viewModel.authText)
                        .font(.PoppinsRegular(16))
                        .foregroundColor(.textGrey)
                }
                .padding(.horizontal, 32)

                
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

