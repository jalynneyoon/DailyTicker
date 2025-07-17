// SecondaryButton.swift
// DesignSystem
// SwiftUI용 Secondary 버튼 컴포넌트

import SwiftUI

public struct SecondaryButton: View {
    public let title: String
    public var action: () -> Void

    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(DesignSystemFont.headline)
                .foregroundColor(Color.primary) // 텍스트 색상
                .frame(maxWidth: .infinity)
                .padding(.vertical, Spacing.md.rawValue)
                .background(Color.secondary)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.primary, lineWidth: 1)
                )
        }
    }
}

#if DEBUG
#Preview {
    SecondaryButton(title: "Secondary") {}
        .padding()
        .background(Color.background)
}
#endif
