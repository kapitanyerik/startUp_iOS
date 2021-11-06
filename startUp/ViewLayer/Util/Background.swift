//
//  Background.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 10. 17..
//

import SwiftUI

struct Background: View {
    var body: some View {
        ZStack (alignment: .bottom) {
            RadialGradient(
                colors: [.white, Color("cyan2"), Color("cyan1"), Color("lightBlue2"), Color("lightBlue1"), Color("darkBlue")],
                center: UnitPoint(x: 1, y: 0.69),
                startRadius: 0,
                endRadius: 460
            )
            
            Group {
                GeometryReader { geo in
                    Image("asset8")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width, height: 360)
                        .scaleEffect(1.2)
                        .offset(x: 0, y: 100)
                }
                
                GeometryReader { geo in
                    Image("asset9")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width, height: 360)
                        .scaleEffect(3.0)
                        .offset(x: 160, y: 40)
                }
                
                GeometryReader { geo in
                    Image("asset10")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width, height: 360)
                        .scaleEffect(4.0)
                        .offset(x: -160, y: 120)
                }
                
                GeometryReader { geo in
                    Image("asset9")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width, height: 360)
                        .scaleEffect(2.2)
                        .offset(x: -60, y: 100)
                }
                
                GeometryReader { geo in
                    Image("asset12")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width, height: 360)
                        .scaleEffect(2.2)
                        .offset(x: -140, y: -60)
                }
                
                GeometryReader { geo in
                    Image("asset12")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width, height: 360)
                        .scaleEffect(2.0)
                        .offset(x: -120, y: 520)
                }
                
                GeometryReader { geo in
                    Image("asset10")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width, height: 360)
                        .scaleEffect(2.2)
                        .offset(x: 160, y: -20)
                }
                
                GeometryReader { geo in
                    Image("asset11")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width, height: 360)
                        .scaleEffect(2.4)
                        .offset(x: -120, y: 280)
                }
            }
        }
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
