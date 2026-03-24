import SwiftUI

struct ProfileSetupView: View {
    let onContinue: () -> Void

    @State private var ownerAge = ""
    @State private var ownerSex = ""
    @State private var location = ""
    @State private var dogName = ""
    @State private var dogAge = ""
    @State private var statusMessage = ""

    var body: some View {
        AuthCard {
            BrandHeader(
                title: "Join PetPlayDate.ai",
                subtitle: "Create your account and find your pup's perfect playmate."
            )

            VStack(spacing: 26) {
                AppTextField(title: "Your Age *", placeholder: "Your age", text: $ownerAge)

                AppPickerField(
                    title: "Sex *",
                    selectionTitle: "Select your sex",
                    options: ["Female", "Male", "Non-binary", "Prefer not to say"],
                    selection: $ownerSex
                )

                AppTextField(title: "Location *", placeholder: "City, State", text: $location)

                Divider()
                    .overlay(AppTheme.border)
                    .padding(.vertical, 4)

                Text("Your Dog's Information")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundStyle(AppTheme.text)
                    .frame(maxWidth: .infinity, alignment: .leading)

                AppTextField(title: "Dog's Name *", placeholder: "e.g., Max", text: $dogName)
                AppTextField(title: "Age *", placeholder: "Your dog's age", text: $dogAge)

                PrimaryButton(title: "Continue") {
                    let required = [ownerAge, ownerSex, location, dogName, dogAge]
                    let missing = required.contains { $0.trimmingCharacters(in: .whitespaces).isEmpty }

                    guard !missing else {
                        statusMessage = "Please complete all required profile fields."
                        return
                    }

                    statusMessage = "Profile saved. Moving to your PetPlayDate.ai dog details."
                    onContinue()
                }

                StatusText(text: statusMessage)
            }
        }
    }
}

#Preview {
    ProfileSetupView(onContinue: {})
}
