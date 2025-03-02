import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false
    @State private var titleOpacity = 0.0
    @State private var titleScale: CGFloat = 0.5
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor(red: 15/255, green: 27/255, blue: 45/255, alpha: 1))
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    Text("Welcome to To-Do App")
                        .font(.title)
                        .bold()
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.white)
                        .opacity(titleOpacity)
                        .scaleEffect(titleScale)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.5)) {
                                titleOpacity = 1.0
                                titleScale = 1.0
                            }
                        }

                    Spacer()
                    VStack(spacing: 20) {
                        NavigationLink(destination: TaskListView()) {
                            Text("Go to Task List")
                                .font(.headline)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal, 40)
                        }

                        NavigationLink(destination: AboutView()) {
                            Text("About")
                                .font(.headline)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal, 40)
                        }
                    }
                    .padding(.bottom, 40)
                }
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(isAnimating ? 1 : 0.8)
                .onAppear {
                    withAnimation(.spring(response: 1, dampingFraction: 0.7, blendDuration: 0.5)) {
                        isAnimating = true
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Home")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
