import SwiftUI

enum AppTheme {
    static let top = Color(red: 15 / 255, green: 37 / 255, blue: 71 / 255)
    static let mid = Color(red: 35 / 255, green: 74 / 255, blue: 119 / 255)
    static let bottom = Color(red: 122 / 255, green: 198 / 255, blue: 210 / 255)

    static let card = Color.white.opacity(0.92)
    static let text = Color(red: 16 / 255, green: 32 / 255, blue: 51 / 255)
    static let muted = Color(red: 95 / 255, green: 114 / 255, blue: 136 / 255)
    static let border = Color(red: 200 / 255, green: 215 / 255, blue: 226 / 255)
    static let accent = Color(red: 61 / 255, green: 139 / 255, blue: 253 / 255)
    static let accentDark = Color(red: 44 / 255, green: 111 / 255, blue: 209 / 255)
    static let badgeTop = Color(red: 143 / 255, green: 224 / 255, blue: 220 / 255)
    static let badgeBottom = Color(red: 57 / 255, green: 119 / 255, blue: 213 / 255)

    static let background = ZStack {
        LinearGradient(
            colors: [top, mid, bottom],
            startPoint: .top,
            endPoint: .bottom
        )

        Circle()
            .fill(Color.white.opacity(0.10))
            .frame(width: 260, height: 260)
            .blur(radius: 10)
            .offset(x: -150, y: -260)

        Circle()
            .fill(accent.opacity(0.20))
            .frame(width: 300, height: 300)
            .blur(radius: 24)
            .offset(x: 160, y: 320)
    }
}
