//
//  MenuComparisonView.swift
//  PopoversXcodeApp
//
//  Created by A. Zheng (github.com/aheze) on 2/5/22.
//  Copyright © 2022 A. Zheng. All rights reserved.
//

import Popovers
import SwiftUI

struct MenuComparisonView: View {
    var body: some View {
        NavigationLink(destination: MenuComparisonDestinationView()) {
            ExampleTestingRow(
                image: "contextualmenu.and.cursorarrow",
                title: "Menu Comparison View",
                color: 0xA000FF
            ) {}
                .disabled(true) /// `NavigationLink` is a button already, so disable`ExampleRow`'s inner button
        }
    }
}

struct MenuComparisonDestinationView: View {
    @State var present = false
    @State var iconName = "list.bullet"

    var body: some View {
        VStack {
            Text("Compare Popovers' custom menu with the system menu.")

            Templates.Menu {
                Templates.MenuButton(title: "Change Icon To List", systemImage: "list.bullet") {
                    iconName = "list.bullet"
                }
                Templates.MenuButton(title: "Change Icon To Keyboard", systemImage: "keyboard") {
                    iconName = "keyboard"
                }
                Templates.MenuButton(title: "Change Icon To Bag", systemImage: "bag") {
                    iconName = "bag"
                }
            } label: { isPressed in
                ExampleShowroomRow(color: UIColor(hex: 0xFF00AB)) {
                    HStack {
                        ExampleImage(iconName, color: UIColor(hex: 0xFF00AB))

                        Text("Popovers Menu")
                            .fontWeight(.medium)
                    }
                }
                .opacity(isPressed ? 0.5 : 1)
            }

            Menu {
                Button {
                    iconName = "list.bullet"
                } label: {
                    Label("Change Icon To List", systemImage: "list.bullet")
                }

                Button {
                    iconName = "keyboard"
                } label: {
                    Label("Change Icon To Keyboard", systemImage: "keyboard")
                }

                Button {
                    iconName = "bag"
                } label: {
                    Label("Change Icon To Bag", systemImage: "bag")
                }

            } label: {
                ExampleShowroomRow(color: UIColor(hex: 0xFF004E)) {
                    HStack {
                        ExampleImage(iconName, color: UIColor(hex: 0xFF004E))

                        Text("System Menu")
                            .fontWeight(.medium)
                    }
                }
            }

            Templates.Menu(configuration: {
                var configuration = Templates.MenuConfiguration()
                configuration.width = nil
                return configuration
            }()) {
                Templates.MenuItem {
                    iconName = "list.bullet"
                } label: { pressed in
                    HStack {
                        MenuImageView(image: "list.bullet", color: .red)
                        Text("Change Icon To List")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 14, leading: 18, bottom: 14, trailing: 18))
                    .background(pressed ? Templates.buttonHighlightColor : Color.clear) /// Add highlight effect when pressed.
                }

                Templates.MenuItem {
                    iconName = "keyboard"
                } label: { pressed in
                    HStack {
                        MenuImageView(image: "keyboard", color: .green)
                        Text("Change Icon To Keyboard")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 14, leading: 18, bottom: 14, trailing: 18))
                    .background(pressed ? Templates.buttonHighlightColor : Color.clear) /// Add highlight effect when pressed.
                }

                Templates.MenuItem {
                    iconName = "bag"
                } label: { pressed in
                    HStack {
                        MenuImageView(image: "bag", color: .blue)
                        Text("Change Icon To Bag")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 14, leading: 18, bottom: 14, trailing: 18))
                    .background(pressed ? Templates.buttonHighlightColor : Color.clear) /// Add highlight effect when pressed.
                }
            } label: { isPressed in
                ExampleShowroomRow(color: UIColor(hex: 0xFF1900)) {
                    HStack {
                        ExampleImage(iconName, color: UIColor(hex: 0xFF1900))

                        Text("Popovers Menu (Customized)")
                            .fontWeight(.medium)
                    }
                }
                .opacity(isPressed ? 0.5 : 1)
            }
        }
        .padding()
    }
}

struct MenuImageView: View {
    let image: String
    var color: UIColor
    var body: some View {
        Image(systemName: image)
            .font(.system(size: 19, weight: .medium))
            .foregroundColor(.white)
            .frame(width: 40, height: 40)
            .background(
                LinearGradient(
                    colors: [
                        Color(uiColor: color.offset(by: 0.2)),
                        Color(uiColor: color),
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.white, lineWidth: 1.5)
                    .opacity(0.8)
            }
    }
}
