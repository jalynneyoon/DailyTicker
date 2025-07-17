// HomeView.swift
// SampleApp
// 디자인시스템 기반 홈 화면 예시

import SwiftUI

public struct HomeView: View {
    let items = [
        (title: "공지사항", subtitle: "중요 업데이트가 있습니다."),
        (title: "할 일", subtitle: "오늘 할 일을 확인하세요."),
        (title: "추천 소식", subtitle: "새로운 소식을 받아보세요.")
    ]

    @State private var showToast = false
    @State private var toastMessage = ""

    public init() {}

    public var body: some View {
        NavigationView {
            VStack(spacing: Spacing.xl.rawValue) {
                HStack {
                    Text("홈")
                        .font(DesignSystemFont.largeTitle)
                        .foregroundColor(.primary)
                    Spacer()
                    Button(action: {
                        toastMessage = "알림 버튼을 눌렀습니다!"
                        showToast = true
                    }) {
                        Image(systemName: "bell")
                            .foregroundColor(.primary)
                            .padding(Spacing.sm.rawValue)
                    }
                }
                .padding(.horizontal)
                ScrollView {
                    VStack(spacing: Spacing.xl.rawValue) {
                        ForEach(items, id: \.title) { item in
                            Card {
                                VStack(alignment: .leading, spacing: Spacing.sm.rawValue) {
                                    Text(item.title)
                                        .font(DesignSystemFont.title)
                                    Text(item.subtitle)
                                        .font(DesignSystemFont.body)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
                PrimaryButton(title: "피드 새로고침") {
                    toastMessage = "피드 새로고침!"
                    showToast = true
                }
                .padding(.horizontal)
            }
            .toast(message: toastMessage, isVisible: $showToast)
            .background(Color.background.ignoresSafeArea())
            .navigationBarHidden(true)
        }
    }
}

#if DEBUG
#Preview {
    HomeView()
}
#endif
