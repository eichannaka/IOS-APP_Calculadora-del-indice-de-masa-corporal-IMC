//
//  IMCResult.swift
//  IOS
//
//

import SwiftUI

struct IMCResult: View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        VStack{
            Text("Tu resultado").font(.title).bold().foregroundStyle(.white)
            let result = calculateIMC(weight: userWeight, height: userHeight)
            InformationView(result: result)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
    }
}

func calculateIMC(weight:Double, height:Double)->Double{
    let result = weight / ((height / 100) * (height / 100))
    return result
    
}

struct InformationView:View {
    let result:Double
    var body: some View {
        let information = getImcResult(result: result)
        VStack{
            Spacer()
            Text(information.0).foregroundColor(information.2).font(.title).bold()
            Spacer()
            Text("\(result,specifier: "%.2f")").font(.system(size: 80)).bold().foregroundColor(.white)
            Spacer()
            Text(information.1).foregroundColor(.white).font(.title2).padding(.horizontal, 8)
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent).cornerRadius(16).padding(16);
    }
}

func getImcResult(result:Double)->(String,String,Color){
    let title:String
    let descripcion:String
    let color:Color
    
    switch result {
    case 0.00...19.99:
        title = "Peso bajo"
        descripcion = "Estas por debajo del peso recomendado segun el IMC"
        color = .yellow
    case 20.00...24.99:
        title = "Peso Normal"
        descripcion = "Estas en el peso recomendado segun el IMC."
        color = .green
    case 25.00...29.99:
        title = "Sobrepeso"
        descripcion = "Estas por encima del peso recomendado segun el IMC"
        color = .orange
    case 30.00...100:
        title = "Obesidad"
        descripcion = "Estas muy por encima del peso recomenado segun el IMC"
        color = .red
    default:
        title = "ERROR"
        descripcion = "Ha ocurrido un error"
        color = Color.gray
    }
    return (title,descripcion,color)
}
#Preview {
    IMCResult(userWeight:80,userHeight:190)
}
