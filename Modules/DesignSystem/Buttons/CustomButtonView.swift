import SwiftUI

struct CustomButtonView: View {
    
    let title: String
    let typeFill: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("Roboto-Bold", size: 18))
                .foregroundColor(typeFill ? .white : .brandClr)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(typeFill ? Color.brandClr : Color.clear)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.brandClr, lineWidth: typeFill ? 0 : 1)
                )
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        CustomButtonView(title: "Filled Button", typeFill: true) {
            print("Filled tapped")
        }
        CustomButtonView(title: "Outline Button", typeFill: false) {
            print("Outline tapped")
        }
    }
    .padding()
}
