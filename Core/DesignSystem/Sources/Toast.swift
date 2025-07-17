// Toast.swift
// DesignSystem
// SwiftUI Toast(일시적 메시지) 컴포넌트

import SwiftUI

public struct Toast: View {
    public let message: String
    public var backgroundColor: Color = .primary
    public var foregroundColor: Color = .white
    public var duration: Double = 2.0
    @Binding public var isVisible: Bool

    public init(message: String, isVisible: Binding<Bool>, backgroundColor: Color = .primary, foregroundColor: Color = .white, duration: Double = 2.0) {
        self.message = message
        self._isVisible = isVisible
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.duration = duration
    }

    public var body: some View {
        if isVisible {
            Text(message)
                .font(DesignSystemFont.body)
                .padding(.horizontal, Spacing.lg.rawValue)
                .padding(.vertical, Spacing.sm.rawValue)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(12)
                .shadow(radius: 6)
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation { isVisible = false }
                    }
                }
        }
    }
}

extension View {
    public func toast(message: String, isVisible: Binding<Bool>, backgroundColor: Color = .primary, foregroundColor: Color = .white, duration: Double = 2.0) -> some View {
        self.modifier(ToastModifier(message: message, isVisible: isVisible, backgroundColor: backgroundColor, foregroundColor: foregroundColor, duration: duration))
    }
}

struct ToastModifier: ViewModifier {
    let message: String
    @Binding var isVisible: Bool
    var backgroundColor: Color
    var foregroundColor: Color
    var duration: Double
    
    func body(content: Content) -> some View {
        ZStack {
            content
            Toast(message: message, isVisible: $isVisible, backgroundColor: backgroundColor, foregroundColor: foregroundColor, duration: duration)
                .padding(.bottom, Spacing.lg.rawValue)
        }
        .animation(.easeInOut, value: isVisible)
        .onAppear {
            if isVisible {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    withAnimation { isVisible = false }
                }
            }
        }
    }
}


#if DEBUG
#Preview {
    struct ToastDemo: View {
        @State private var showToast = true
        var body: some View {
            VStack {
                Spacer()
                Toast(message: "Hello, Toast!", isVisible: $showToast)
                    .padding(.bottom)
            }.background(Color.background)
        }
    }
    return ToastDemo()
}
#endif
