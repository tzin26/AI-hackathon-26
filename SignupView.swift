import SwiftUI

struct SignupView: View {
    let onLogin: () -> Void
    let onContinue: () -> Void

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var age = ""
    @State private var statusMessage = ""

    var body: some View {
        AuthCard {
            BrandHeader(
                title: "Join PetPlayDate.ai",
                subtitle: "Create your account and start discovering safe, friendly playdates for you and your pup."
            )

            VStack(spacing: 26) {
                AppTextField(title: "First Name *", placeholder: "Your first name", text: $firstName)
                AppTextField(title: "Last Name *", placeholder: "Your last name", text: $lastName)
                AppTextField(title: "Username *", placeholder: "Choose a username", text: $username)
                AppSecureField(title: "Password *", placeholder: "Create a password", text: $password)
                AppSecureField(title: "Re-enter Password *", placeholder: "Re-enter your password", text: $confirmPassword)
                AppTextField(title: "Your Age *", placeholder: "Your age", text: $age)

                PrimaryButton(title: "Create Account") {
                    let fields = [firstName, lastName, username, password, confirmPassword, age]
                    let missing = fields.contains { $0.trimmingCharacters(in: .whitespaces).isEmpty }

                    guard !missing else {
                        statusMessage = "Please complete all required fields."
                        return
                    }

                    guard password == confirmPassword else {
                        statusMessage = "Passwords do not match. Please try again."
                        return
                    }

                    statusMessage = "Account created for \(firstName). Redirecting to your PetPlayDate.ai profile setup."
                    onContinue()
                }

                HStack(spacing: 4) {
                    Text("Already have an account?")
                        .foregroundStyle(AppTheme.muted)
                    Button("Log in here") {
                        onLogin()
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
    SignupView(onLogin: {}, onContinue: {})
}
