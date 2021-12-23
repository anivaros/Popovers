import SwiftUI
import Popovers

struct StandardView: View {
    @State var present = false
    
    var body: some View {
        Button {
            present = true
        } label: {
            ExampleShowroomRow(color: UIColor(hex: 0x474747)) {
                HStack {
                    ExampleImage("arrowtriangle.down.fill", color: UIColor(hex: 0x474747))
                    
                    Text("Standard")
                        .fontWeight(.medium)
                }
            }
        }
        .popover(
            present: $present,
            attributes: {
                $0.sourceFrameInset.top = -8
                $0.position = .absolute(
                    originAnchor: .top,
                    popoverAnchor: .bottom
                )
            }
        ) {
            PopoverTemplates.Container {
                Text("This is a pretty standard-looking popover with an arrow.")
            }
            .frame(maxWidth: 300)
        }
    }
}
