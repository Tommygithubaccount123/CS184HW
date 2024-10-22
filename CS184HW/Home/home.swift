import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                // Display user email if available
                if let user = viewModel.currentUser {
                    HStack {
                        Text("Logged in as: \(user.email)")
                            .font(.headline)
                            .padding()
                    }
                }

                // Navigation link to go to the home screen
                NavigationLink(destination: HomeScreen()) {
                    Text("Go to Home Screen")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()

                // Sign out button
                Button {
                    viewModel.signOut()
                } label: {
                    Text("Sign out")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Dashboard")
        }
    }
}

// HomeScreen View
struct HomeScreen: View {
    var body: some View {
        VStack {
            Text("Welcome to the Home Screen!")
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle("Home Screen")
    }
}

// Preview for HomeView
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
