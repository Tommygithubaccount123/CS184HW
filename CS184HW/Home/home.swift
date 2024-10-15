import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            HStack {
                Text(user.email)
            }
        }
        
        Button {
            viewModel.signOut()
        } label: {
            Text("Sign out")
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
