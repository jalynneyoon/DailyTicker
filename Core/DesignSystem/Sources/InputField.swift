// InputField.swift
// DesignSystem
// SwiftUI용 기본 InputField(텍스트 입력) 컴포넌트

import SwiftUI

public struct InputField: View {
    @Binding public var text: String
    public let placeholder: String

    public init(text: Binding<String>, placeholder: String = "") {
        self._text = text
        self.placeholder = placeholder
    }

    public var body: some View {
        TextField(placeholder, text: $text)
            .font(DesignSystemFont.body)
            .padding(.horizontal, Spacing.md.rawValue)
            .padding(.vertical, Spacing.sm.rawValue)
            .background(Color.background)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primary.opacity(0.15), lineWidth: 1)
            )
            .foregroundColor(.textPrimary)
    }
}

#if DEBUG
#Preview {
    @State var text = ""
    return InputField(text: $text).padding().background(Color(.systemGroupedBackground))
}
#endif
