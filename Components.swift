import SwiftUI

struct AuthCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 24) {
            content
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 30)
        .frame(maxWidth: 820)
        .background(AppTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(Color.white.opacity(0.45), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.14), radius: 28, x: 0, y: 18)
    }
}

struct BrandHeader: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(spacing: 22) {
            DogFaceLogo()

            Text(title)
                .font(.system(size: 38, weight: .bold, design: .rounded))
                .foregroundStyle(AppTheme.text)
                .multilineTextAlignment(.center)

            Text(subtitle)
                .font(.system(size: 18, weight: .regular, design: .rounded))
                .foregroundStyle(AppTheme.muted)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .padding(.horizontal, 10)
        }
    }
}

struct DogFaceLogo: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [AppTheme.badgeTop, AppTheme.badgeBottom],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 136, height: 136)

            ZStack {
                DogEarShape()
                    .fill(Color(red: 201 / 255, green: 160 / 255, blue: 126 / 255))
                    .frame(width: 34, height: 54)
                    .overlay(DogEarShape().stroke(AppTheme.text, lineWidth: 3))
                    .rotationEffect(.degrees(22))
                    .offset(x: -36, y: -6)

                DogEarShape()
                    .fill(Color(red: 201 / 255, green: 160 / 255, blue: 126 / 255))
                    .frame(width: 34, height: 54)
                    .overlay(DogEarShape().stroke(AppTheme.text, lineWidth: 3))
                    .rotationEffect(.degrees(-22))
                    .offset(x: 36, y: -6)

                Circle()
                    .fill(Color(red: 1.0, green: 0.99, blue: 0.97))
                    .frame(width: 74, height: 74)
                    .overlay(Circle().stroke(AppTheme.text, lineWidth: 3))
                    .offset(y: 4)

                HStack(spacing: 24) {
                    Circle()
                        .fill(AppTheme.text)
                        .frame(width: 8, height: 8)
                    Circle()
                        .fill(AppTheme.text)
                        .frame(width: 8, height: 8)
                }
                .offset(y: -8)

                Capsule()
                    .fill(AppTheme.text)
                    .frame(width: 18, height: 12)
                    .offset(y: 12)

                DogMouthShape()
                    .stroke(AppTheme.text, lineWidth: 3)
                    .frame(width: 34, height: 18)
                    .offset(y: 24)

                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color(red: 1.0, green: 124 / 255, blue: 148 / 255))
                    .frame(width: 14, height: 18)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(AppTheme.text, lineWidth: 3)
                    )
                    .offset(y: 36)
            }
        }
        .shadow(color: AppTheme.accent.opacity(0.22), radius: 18, x: 0, y: 10)
    }
}

struct DogEarShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.midY),
            control: CGPoint(x: rect.maxX + 4, y: rect.minY + 8)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.maxY),
            control: CGPoint(x: rect.maxX, y: rect.maxY + 4)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.midY),
            control: CGPoint(x: rect.minX, y: rect.maxY + 2)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.minY),
            control: CGPoint(x: rect.minX - 4, y: rect.minY + 8)
        )
        return path
    }
}

struct DogMouthShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addQuadCurve(
            to: CGPoint(x: rect.minX + 2, y: rect.midY),
            control: CGPoint(x: rect.minX + 8, y: rect.minY + 4)
        )
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - 2, y: rect.midY),
            control: CGPoint(x: rect.maxX - 8, y: rect.minY + 4)
        )
        path.move(to: CGPoint(x: rect.midX, y: rect.minY - 6))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

struct DogFaceLogo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()
            DogFaceLogo()
        }
    }
}

struct AppTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundStyle(AppTheme.text)

            TextField(placeholder, text: $text)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(.horizontal, 18)
                .padding(.vertical, 18)
                .background(Color.white.opacity(0.90))
                .foregroundStyle(AppTheme.text)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(AppTheme.border, lineWidth: 1)
                )
        }
    }
}

struct AppSecureField: View {
    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundStyle(AppTheme.text)

            SecureField(placeholder, text: $text)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(.horizontal, 18)
                .padding(.vertical, 18)
                .background(Color.white.opacity(0.90))
                .foregroundStyle(AppTheme.text)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(AppTheme.border, lineWidth: 1)
                )
        }
    }
}

struct AppPickerField: View {
    let title: String
    let selectionTitle: String
    let options: [String]
    @Binding var selection: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundStyle(AppTheme.text)

            Menu {
                ForEach(options, id: \.self) { option in
                    Button(option) { selection = option }
                }
            } label: {
                HStack {
                    Text(selection.isEmpty ? selectionTitle : selection)
                        .foregroundStyle(selection.isEmpty ? AppTheme.muted : AppTheme.text)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundStyle(AppTheme.muted)
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 18)
                .background(Color.white.opacity(0.90))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(AppTheme.border, lineWidth: 1)
                )
            }
        }
    }
}

struct AppTextEditor: View {
    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundStyle(AppTheme.text)

            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white.opacity(0.90))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(AppTheme.border, lineWidth: 1)
                    )

                if text.isEmpty {
                    Text(placeholder)
                        .foregroundStyle(AppTheme.muted)
                        .padding(.horizontal, 22)
                        .padding(.vertical, 20)
                }

                TextEditor(text: $text)
                    .scrollContentBackground(.hidden)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .frame(minHeight: 140)
                    .foregroundStyle(AppTheme.text)
                    .background(Color.clear)
            }
            .frame(minHeight: 140)
        }
    }
}

struct PrimaryButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(
                    LinearGradient(
                        colors: [AppTheme.accent, AppTheme.accentDark],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: AppTheme.accent.opacity(0.28), radius: 16, x: 0, y: 10)
        }
        .buttonStyle(.plain)
    }
}

struct StatusText: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 15, weight: .medium, design: .rounded))
            .foregroundStyle(AppTheme.accent)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, minHeight: 24)
    }
}
