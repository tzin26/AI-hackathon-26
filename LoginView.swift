import SwiftUI

struct LoginView: View {
    let onLogin: () -> Void
    let onSignup: () -> Void

    @State private var username = ""
    @State private var password = ""
    @State private var statusMessage = ""

    var body: some View {
        AuthCard {
            BrandHeader(
                title: "PetPlayDate.ai",
                subtitle: "Welcome back. Connect with pet lovers and find your companion's next favorite playdate."
            )

            VStack(spacing: 26) {
                AppTextField(
                    title: "Username",
                    placeholder: "Enter your username",
                    text: $username
                )

                AppSecureField(
                    title: "Password",
                    placeholder: "Enter your password",
                    text: $password
                )

                PrimaryButton(title: "Log In") {
                    guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
                          !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                        statusMessage = "Please enter both your username and password."
                        return
                    }

                    statusMessage = "Welcome back, \(username)! Redirecting to your PetPlayDate.ai profile setup."
                    onLogin()
                }

                HStack(spacing: 4) {
                    Text("Don't have an account?")
                        .foregroundStyle(AppTheme.muted)
                    Button("Sign up for free!") {
                        onSignup()
                    }
                    .foregroundStyle(AppTheme.accent)
                    .fontWeight(.medium)
                }
                .font(.system(size: 16, weight: .regular, design: .rounded))

                StatusText(text: statusMessage)
            }
        }
    }
}

#Preview {
    LoginView(onLogin: {}, onSignup: {})
}
