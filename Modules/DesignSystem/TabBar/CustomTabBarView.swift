import SwiftUI

struct CustomTabBarView: View {

    @Binding var selectedIndex: Int

    private let items: [(image: String, tag: Int)] = [
        ("home", 0),
        ("map", 1),
        ("profile", 2)
    ]

    var body: some View {
        HStack(spacing: 83) {
            ForEach(items, id: \.tag) { item in
                Button {
                    selectedIndex = item.tag
                } label: {
                    Image(item.image)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .foregroundColor(
                            selectedIndex == item.tag ? .brandClr : .textGrey
                        )
                }
                .buttonStyle(.plain)
            }
        }
    }
}
