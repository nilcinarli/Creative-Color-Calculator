import SwiftUI

struct ContentView: View {
    @State private var selectedColors: [Color] = []
    
    var body: some View {
        VStack {
            Text("Color Mixer Special Edition- Heart Collection")
                .font(.custom("Arial", size: 28)) 
                .padding()  
                .background(.gray)
                .foregroundColor(.white)
                .cornerRadius(0)
    
             
            
            Text("Colors:")
                .font(.custom("Arial", size: 25)) 
                .padding()
            
            HStack {
                ForEach(Color.allCases, id: \.self) { color in
                    Button(action: {
                        selectColor(color)
                    }) {
                        Text("❤️")
                            .font(.largeTitle)
                            .padding()
                            .background(color)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                    }
                }
                
                Button(action: {
                    mixColors()
                }) {
                    Text("+")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
            }
            
            if !selectedColors.isEmpty {
                Text("Mixed Color:")
                    .font(.title)
                    .padding()
                
                Text("❤️")
                    .font(.largeTitle)
                    .padding()
                    .background(getMixedColor())
                    .foregroundColor(.white)
                    .cornerRadius(40)
            }
        }
    }
    
    func selectColor(_ color: Color) {
        if selectedColors.count < 2 {
            selectedColors.append(color)
        }
    }
    
    func mixColors() {
        if selectedColors.count == 2 {
           
            let color1 = selectedColors[0]
            let color2 = selectedColors[1]
        
            let mixedColor = mixColors(color1, color2)
            
           
            selectedColors = [mixedColor]
        }
    }
    
    func mixColors(_ color1: Color, _ color2: Color) -> Color {
    
        let components1 = color1.components()
        let components2 = color2.components()
        
        let red = (components1.red + components2.red) / 2
        let green = (components1.green + components2.green) / 2
        let blue = (components1.blue + components2.blue) / 2
        
        return Color(red: red, green: green, blue: blue)
    }
    
    func getMixedColor() -> Color {
        guard selectedColors.count == 1 else {
            return .gray
        }
        return selectedColors[0]
    }
}

extension Color {
    func components() -> (red: Double, green: Double, blue: Double) {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: nil)
        return (Double(red), Double(green), Double(blue))
    }
    
    static var allCases: [Color] {
        return [.red, .blue, .green, .orange,  .yellow]
    }
}

