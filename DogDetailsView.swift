import SwiftUI

struct DogDetailsView: View {
    let onBackToLogin: () -> Void

    @State private var breed = ""
    @State private var dogGender = ""
    @State private var dogSize = ""
    @State private var aboutDog = ""
    @State private var statusMessage = ""

    private let breedOptions = [
        "Golden Retriever",
        "Labrador Retriever",
        "German Shepherd",
        "French Bulldog",
        "Poodle",
        "Mixed Breed"
    ]

    var body: some View {
        AuthCard {
            BrandHeader(
                title: "Join PetPlayDate.ai",
                subtitle: "Create your account and find your pup's perfect playmate."
            )

            VStack(spacing: 26) {
                AppPickerField(
                    title: "Breed *",
                    selectionTitle: "Select breed",
                    options: breedOptions,
                    selection: $breed
                )

                AppPickerField(
                    title: "Gender *",
                    selectionTitle: "Select gender",
                    options: ["Female", "Male"],
                    selection: $dogGender
                )

                AppPickerField(
                    title: "Size *",
                    selectionTitle: "Select size",
                    options: ["Small", "Medium", "Large"],
                    selection: $dogSize
                )

                AppTextEditor(
                    title: "About Your Dog (Optional)",
                    placeholder: "Tell us about your dog's personality...",
                    text: $aboutDog
                )

                PrimaryButton(title: "Sign Up") {
                    let required = [breed, dogGender, dogSize]
                    let missing = required.contains { $0.trimmingCharacters(in: .whitespaces).isEmpty }

                    guard !missing else {
                        statusMessage = "Please complete all required dog details."
                        return
                    }

                    statusMessage = "Sign up complete. Your PetPlayDate.ai profile is ready."
                }

                Button("Back to login") {
                    onBackToLogin()
                }
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundStyle(AppTheme.accent)

                StatusText(text: statusMessage)
            }
        }
    }
}

#Preview {
    DogDetailsView(onBackToLogin: {})
}
