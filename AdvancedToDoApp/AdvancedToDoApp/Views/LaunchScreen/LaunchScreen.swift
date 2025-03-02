import SwiftUI

struct LaunchScreen: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            TaskListView()
        } else {
            ZStack {
                Color.white.ignoresSafeArea()
                Image("AppLogo") 
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
