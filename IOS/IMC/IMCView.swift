import SwiftUI

struct IMCView: View {
    
    @State var gender:Int=0
    @State var age:Int=18
    @State var weight:Int=80
    @State var height:Double=150
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    ToggleButton(text: "Hombre", imageName: "heart.fill",gender: 0,selectGender: $gender)
                    ToggleButton(text: "Mujer", imageName:"star.fill", gender: 1,selectGender: $gender)
                }
                HeightCalculator(selectedHeight: $height)
                HStack{
                    CounterButton(text: "Edad",number:$age )
                    CounterButton(text: "Peso",number:$weight )
                }
                IMCCalculateButton(userWeight:Double(weight) , userHeight:height)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("IMC Calculator")
                        .bold()
                        .foregroundColor(.white)
                }
            }
        }
    }
}
struct IMCCalculateButton: View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        NavigationStack {
            NavigationLink   (destination: {IMCResult(userWeight:userWeight,userHeight:userHeight)}) {
                Text("Calcular").font(.title).bold().foregroundColor(.purple)
                    .frame(maxWidth: .infinity, maxHeight: 100).background(.backgroundComponent)
                
            }
        }
    }
}

struct ToggleButton: View {
    let text: String
    let imageName: String
    let gender: Int
    @Binding var selectGender:Int
    var body: some View {
        
        let color = if(gender == selectGender){
            Color.backgroundSelected
        }else{
            Color.backgroundComponent
        }
        Button(action: {
            selectGender=gender
        }) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundStyle(.white)
                InformationText(text: text)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color)
        }
    }
}
struct InformationText: View {
    let text:String
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
        
    }
}

struct TitleText: View {
    let text:String
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct HeightCalculator:View {
    @Binding var selectedHeight: Double
    var body: some View {
        VStack {
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight,in:100...220,step: 1)
            
        }.frame(maxWidth: .infinity,maxHeight:  .infinity)
            .background(.backgroundComponent)
    }
}

struct CounterButton:View {
    let text:String
    @Binding var number:Int
    var body: some View {
        VStack  {
            TitleText(text:text)
            InformationText(text: String(number))
            HStack{
                
                Button(action:{
                    if number > 0{
                        number -= 1
                    }
                }) {
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: ("minus"))
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25,height: 25)
                    }
                }
                
                Button(action:{
                    if number < 100{
                        number += 1
                    }
                }) {
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: ("plus"))
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25,height: 25)
                    }
                }
                
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.backgroundComponent)
    }
}
#Preview {
    IMCView()
}
