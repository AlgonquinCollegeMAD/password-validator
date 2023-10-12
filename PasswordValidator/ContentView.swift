import SwiftUI

enum PasswordValidatorStatus {
  case matched
  case error
}

struct ContentView: View {
  
  @State var password1: String = ""
  @State var password2: String = ""
  
  private var canContinue: Bool {
    password1.count > 0 && password1 == password2
  }
  
    var body: some View {
        VStack {
          TextField("Enter your password", text: $password1)
            .textFieldStyle(.roundedBorder)
          TextField("Retype your password", text: $password2)
            .textFieldStyle(.roundedBorder)
          if canContinue {
            Button(action: {
              // Do Something
            }, label: {
              Text("Ok")
            })
          }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
