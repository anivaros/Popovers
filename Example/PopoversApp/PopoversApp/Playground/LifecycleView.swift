import SwiftUI
import Popovers

struct LifecycleView: View {
    @State var present = false
    
    var body: some View {
        ExampleRow(
            image: "arrow.triangle.2.circlepath",
            title: "Lifecycle Animations",
            color: 0xFF7200
        ) {
            present.toggle()
        }
        .popover(
            present: $present,
            attributes: {
                $0.presentation.animation = .spring(
                    response: 0.6,
                    dampingFraction: 0.6,
                    blendDuration: 1
                )
                $0.presentation.transition = .slide
                $0.dismissal.animation = .easeIn(duration: 1)
                $0.dismissal.transition = .move(edge: .bottom).combined(with: .opacity)
            }
        ) {
            VStack(alignment: .leading) {
                Text("You can change the presentation and dismissal animations.")
                
                HStack {
                    ExampleImage("hare.fill", color: 0xFF7200)
                    Text("It boings in.")
                }
                
                HStack {
                    ExampleImage("train.side.front.car", color: 0xFF7200)
                    Text("It slides out.")
                }
            }
            .padding()
            .background(.background)
            .cornerRadius(12)
            .shadow(radius: 1)
        }
    }
}
