import SwiftUI

enum AppScreen {
    case login
    case signup
    case profile
    case dogDetails
}

struct RootFlowView: View {
    @State private var currentScreen: AppScreen = .login

    var body: some View {
        ZStack {
            AppTheme.background
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack {
                    switch currentScreen {
                    case .login:
                        LoginView(
                            onLogin: { currentScreen = .profile },
                            onSignup: { currentScreen = .signup }
                        )
                    case .signup:
                        SignupView(
                            onLogin: { currentScreen = .login },
                            onContinue: { currentScreen = .profile }
                        )
                    case .profile:
                        ProfileSetupView(onContinue: { currentScreen = .dogDetails })
                    case .dogDetails:
                        DogDetailsView(onBackToLogin: { currentScreen = .login })
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 28)
            }
        }
    }
}

#Preview {
    RootFlowView()
}
