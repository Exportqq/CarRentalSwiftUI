import SwiftUI

struct RegisterView: View {

    @StateObject private var viewModel = RegisterViewModel()

    @Environment(\.dismiss) private var dismiss
    var onSignIn: (() -> Void)?

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
                        .frame(height: 364)
                        .clipShape(
                            UnevenRoundedRectangle(
                                topLeadingRadius: 33,
                                topTrailingRadius: 33
                            )
                        )

                    VStack(alignment: .leading, spacing: 16) {

                        CustomTextField(
                            placeholder: "Full name",
                            text: $viewModel.username
                        )

                        CustomTextField(
                            placeholder: "Password",
                            text: $viewModel.password
                        )

                        CustomButtonView(title: "Sign up", typeFill: true) {
                            viewModel.register()
                        }
                        .disabled(!viewModel.isFormValid || viewModel.isLoading)

                        if let error = viewModel.error {
                            Text(error)
                                .foregroundColor(.red)
                                .font(.caption)
                        }

                        HStack {
                            Text(viewModel.getRegister)
                                .foregroundColor(.textGrey)

                            Button {
                                dismiss()
                                onSignIn?()
                            } label: {
                                Text(viewModel.getRegisterText)
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

        .onChange(of: viewModel.isSuccess) { success in
            if success {
                dismiss()
            }
        }
    }
}
