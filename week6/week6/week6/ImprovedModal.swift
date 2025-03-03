//
//  Modal.swift
//  week6
//
//  Created by Beka Batmanashvili on 02.03.25.
//

import SwiftUI


struct ModalButton{
    var action: () -> Void
    var label: String
    var id: String = UUID().uuidString
}

struct ImprovedModal: View {
    @Binding var isModalVisisble: Bool
    
    let buttons: [ModalButton]
    let content: AnyView
    
    init(buttons: [ModalButton], @ViewBuilder content: () -> (some View)?, isModalVisisble: Binding<Bool>){
        self.buttons = buttons
        self.content = AnyView(content())
        self._isModalVisisble = isModalVisisble
    }
    
    
    var body: some View {
        if isModalVisisble {
            ZStack{
                Rectangle().fill(Color.black).opacity(0.7).ignoresSafeArea()
                VStack{
                    content
                    
                    HStack{
                        ForEach(buttons, id: \.id ){ button in
                            Button(action: button.action, label: {
                                Text(button.label)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            })
                            
                        }.padding()
                    }
                }.background(Color.white).cornerRadius(20).padding()
            }
        }
    }
}




#Preview {
    @Previewable @State var isModalVisisble = false
    ZStack{
        VStack{
            Spacer()
            Text(loremText)
            Spacer()
            Button("Press me to open modal", action: {
                print("oepn")
                isModalVisisble = true
            })
            Spacer()
        }.padding()
        ImprovedModal(buttons: [
            ModalButton(action: {
                isModalVisisble = false
            }, label: "Close"),
            ModalButton(action:
                            {isModalVisisble = false}
                        , label: "OK")],
                      content: {
            Text(loremText).padding()
        }, isModalVisisble: $isModalVisisble)
    }
}

