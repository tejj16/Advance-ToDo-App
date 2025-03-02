import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Advanced ToDo App")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .padding(.top, 20)

            Text("A simple and efficient task management app designed to help you organize your daily activities with ease. Track tasks, set priorities, and manage deadlines seamlessly.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Divider().padding(.horizontal)

            VStack(alignment: .leading, spacing: 8) {
                Text("**Developed By:**")
                    .font(.headline)
                    .foregroundColor(.gray)

                VStack(alignment: .leading, spacing: 4) {
                    Text("👤 **Tej Nileshkumar Patel** - 101450840")
                    Text("👤 **Subhan Mohammed Abdul** - 101397394")
                    Text("👤 **Bhavya Vaghela** - 101427560")
                }
                .font(.subheadline)
                .foregroundColor(.primary)
            }
            .padding(.horizontal)

            Spacer()

            Text("Group 12")
                .font(.title) 
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.bottom, 20)
        }
        .navigationTitle("About")
        .padding()
    }
}

#Preview {
    AboutView()
}
