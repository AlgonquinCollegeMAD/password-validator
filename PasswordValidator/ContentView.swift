import SwiftUI

enum PasswordValidatorStatus {
  case matched
  case error
}

struct ContentView: View {
  
  @State var password1: String = ""
  @State var password2: String = ""
  
  private var canContinue: Bool {
    password1 == password2 && password1.count > 0
  }
  
    var body: some View {
        VStack {
          TextField("Enter your password", text: $password1)
            .textFieldStyle(.roundedBorder)
          TextField("Retype your password", text: $password2)
            .textFieldStyle(.roundedBorder)
         
            Button(action: {
              // Do Something
            }, label: {
              Text("Ok")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal, 20)
                .background(
                  Color.accentColor
                    .cornerRadius(10.0)
                    .shadow(radius: 3.0)
                )
                .padding(.top, 40)
            })
            .disabled(canContinue)
          
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
