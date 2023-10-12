import SwiftUI

enum PasswordValidatorStatus {
  case matched
  case error
}

struct ContentView: View {
  
  @State var password1: String = ""
  @State var password2: String = ""
  
  private var canContinue: Bool {
    password1 == password2 && password1.count >= 8 && password1.count <= 12
  }
  
    var body: some View {
        VStack {
          SecureField("Enter your password", text: $password1)
            .textFieldStyle(.roundedBorder)
          SecureField("Retype your password", text: $password2)
            .textFieldStyle(.roundedBorder)
          
          Text("Message")
            .fontWeight(.bold)
            .foregroundStyle(.red)
            .padding(.top, 40)
         
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
            .disabled(!canContinue)
          
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
