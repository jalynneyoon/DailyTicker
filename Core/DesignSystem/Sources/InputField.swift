// InputField.swift
// DesignSystem
// SwiftUI용 기본 InputField(텍스트 입력) 컴포넌트

import SwiftUI

public enum InputFieldState {
    case normal
    case focused
    case error(String?) // 에러 메시지 포함 가능
    case disabled
}

public struct InputField: View {
    @Binding public var text: String
    public let placeholder: String
    public var state: InputFieldState = .normal

    public init(text: Binding<String>, placeholder: String = "", state: InputFieldState = .normal) {
        self._text = text
        self.placeholder = placeholder
        self.state = state
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField(placeholder, text: $text)
                .font(DesignSystemFont.body)
                .padding(.horizontal, Spacing.md.rawValue)
                .padding(.vertical, Spacing.sm.rawValue)
                .background(backgroundColor)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(borderColor, lineWidth: 1)
                )
                .foregroundColor(foregroundColor)
                .disabled(isDisabled)
            if case let .error(message) = state, let message = message, !message.isEmpty {
                Text(message)
                    .font(DesignSystemFont.footnote)
                    .foregroundColor(.error)
                    .padding(.leading, Spacing.md.rawValue)
            }
        }
    }

    private var borderColor: Color {
        switch state {
        case .normal: return Color.primary.opacity(0.15)
        case .focused: return Color.primary
        case .error: return Color.error
        case .disabled: return Color.primary.opacity(0.05)
        }
    }
    private var backgroundColor: Color {
        switch state {
        case .disabled: return Color.primary.opacity(0.03)
        default: return Color.background
        }
    }
    private var foregroundColor: Color {
        switch state {
        case .disabled: return Color.primary.opacity(0.3)
        default: return .textPrimary
        }
    }
    private var isDisabled: Bool {
        if case .disabled = state { return true }
        return false
    }
}

#if DEBUG
#Preview {
    VStack(spacing: 20) {
        StateWrapper(state: .normal, placeholder: "Normal State")
        StateWrapper(state: .focused, placeholder: "Focused State")
        StateWrapper(state: .error("Invalid input"), placeholder: "Error State")
        StateWrapper(state: .error(nil), placeholder: "Error State without message")
        StateWrapper(state: .disabled, placeholder: "Disabled State")
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}

private struct StateWrapper: View {
    @State private var text = ""
    var state: InputFieldState
    var placeholder: String

    var body: some View {
        InputField(text: $text, placeholder: placeholder, state: state)
    }
}
#endif
