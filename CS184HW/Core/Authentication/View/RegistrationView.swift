import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmpassword = ""
    @State private var fullname = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack {
            
            Spacer()
            
            // form fields
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com").autocapitalization(.none)
                InputView(text: $password, title: "Password", placeholder: "Enter password", isSecureField: true)
                InputView(text: $confirmpassword, title: "Confirm Password", placeholder: "Confirm password", isSecureField: true)
            }
            .padding(.horizontal)
            
            
            // sign in button
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                }
            } label: {
                HStack {
                    Text("Sign up")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            // sign up button
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have account, Sign in").fontWeight(.bold)
                }
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
