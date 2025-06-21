//
//  CloneView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Anika Tabasum on 6/11/25.
//

import SwiftUI

struct CloneView: View {
    var body: some View {
        ScrollView{
            Image("Iron")
                .resizable()
                .aspectRatio(contentMode:.fit)//gone
                .scaledToFill()
                .frame(width: 410, height: 400)
                .clipped()
                .overlay(
                    HStack{
                        Button(action:{}){
                            Image(systemName: "chevron.left")
                                .font(.system(size:18,weight:.medium))
                                .padding(10)
                                .background(Color.white.opacity(0.8))
                                .clipShape(Circle())
                        }
                        Spacer()
                    }
                        .padding(.top,44)
                        .padding(.horizontal),
                    alignment: .topLeading
                )
            VStack(
                alignment:.center,spacing: 12){
                    HStack(alignment:.top){
                        VStack(alignment:.leading,spacing:4){
                            Text("The Machanic")
                                .font(.title2).fontWeight(.bold)
                            Text("Avengers,Stark")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        HStack(spacing:4){
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                                .font(.subheadline)
                            Text("5.00")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                    }
                    Text("What  is the Avengers team slogan? 'Avengers Assemble' has long been the team's signature rallying cry, frequently used in the comics. This made it especially iconic when Captain America finally said it in Endgame. Unlike the Avengers, most individual superheroes don't have a distinct catchphrase")
                        .font(.footnote)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("OBSERVATION")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                    
                    VStack(alignment: .leading,spacing: 8){
                        highlightRow(icon:"gearshape.fill", text:"Certified Machanic")
                        highlightRow(icon:"wrench.fill", text:"Incredible Skill")
                        highlightRow(icon:"hammer.fill", text:"A builder")
                        highlightRow(icon:"leaf.fill", text:"Eco friendly ")
                    }
                    .padding()
                    HStack(){
                        Spacer()
                        Text("$ 1 billion/Day")
                            .font(.title3).bold()
                        Spacer()
                       
                        
                    }
                    Button(
                        "Call for Assist"
                    ){}
                        .fontWeight(.semibold)
                        .padding(15)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(24)
                        .frame(width: .infinity,alignment: .center)
                        
                    
                    
                    
                    }
                .padding()
                }
        .edgesIgnoringSafeArea(.top)
            }
    
    @ViewBuilder
    private func highlightRow(icon:String,text:String)-> some View{
        HStack(spacing:12){
            Image(systemName: icon)
                .frame(width: 24,height: 24)
            Text(text)
                .font(.subheadline)
        }
    }
}

#Preview {
    CloneView()
}
