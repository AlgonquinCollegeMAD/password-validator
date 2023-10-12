import SwiftUI

enum PasswordValidatorStatus: Equatable {
  case matched
  case error(String)
}

struct ContentView: View {
  
  @State var password1: String = ""
  @State var password2: String = ""
  
  private var passwordValidationStatus: PasswordValidatorStatus {
    
    if password1.count < 8 { return .error("It must have more than 8 chars")}
    if password1.count > 12 { return .error("It must have less than 12 chars")}
    if password1 != password2 { return .error("Passwords don't match")}
    
    return .matched
  }
  
    var body: some View {
        VStack {
          SecureField("Enter your password", text: $password1)
            .textFieldStyle(.roundedBorder)
          SecureField("Retype your password", text: $password2)
            .textFieldStyle(.roundedBorder)
          
          if case .error(let message) = passwordValidationStatus {
            Text(message)
              .font(.headline)
              .foregroundStyle(.red)
              .padding(.top, 40)
              .frame(height: 40)
          } else {
            Rectangle()
              .frame(height: 40)
              .foregroundColor(.clear)
          }
         
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
            .disabled(passwordValidationStatus != .matched)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
