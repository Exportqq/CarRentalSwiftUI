import SwiftUI

struct ContentView: View {
    
    @State private var labelText = "Hello, world!"
    
    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text(labelText)
                .font(.title2)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(12)
            
            Button(action: {
                labelText = "Кнопка нажата 🚀"
            }) {
                Text("Нажми меня")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
        }
        .padding()
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
            
        )
        .background(Color.white)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
