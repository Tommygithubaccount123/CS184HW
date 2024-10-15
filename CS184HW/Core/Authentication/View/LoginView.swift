import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack {
            
            Spacer()
            
            // form fields
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com").autocapitalization(.none)
                InputView(text: $password, title: "Password", placeholder: "Enter password", isSecureField: true)
            }
            .padding(.horizontal)
            
            
            // sign in button
            Button {
                Task {
                    try await viewModel.signIn(withEmail: email, password: password)
                }
                
            } label: {
                HStack {
                    Text("Sign in")
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
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden()
            } label: {
                HStack(spacing: 3) {
                    Text("Create Account").fontWeight(.bold)
                }
            }
        }
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
