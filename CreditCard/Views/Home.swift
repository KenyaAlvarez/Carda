//
//  Home.swift
//  CreditCard
//
//  Created by Kenya Alvarez on 08/05/23.
//

import SwiftUI

struct Home: View {
    @FetchRequest(entity: Cards.entity(), sortDescriptors: [NSSortDescriptor(key: "name",ascending: true)], animation: .spring()) var results : FetchedResults <Cards>
    
    @State private var show = false
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(results){item in
                        CardView(name: item.name, number:item.number, type: item.type)
                    }
                }.listStyle(.plain)
            }
            .toolbar{
                Button{
                    show.toggle()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.orange)
                }
            }.sheet(isPresented: $show){
                AddCardView(show: $show)
            }.navigationTitle("Credit Cards")
        }
    }
}

struct CardView: View {
    var name : String?
    var number : String?
    var type : String?
    
    @State private var color1 : Color =  .red
    @State private var color2 : Color = .orange
    @State private var creditNumber = ""
    
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Text(type ?? "")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .bold()
            }
            Spacer()
            Text(creditNumber)
                .foregroundColor(.white)
                .font(.title2)
                .bold()
            Spacer()
            HStack{
                VStack(alignment: .leading){
                    Text(name ?? "")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }.frame(width: 300, height: 200)
            .padding(.all)
            .background(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
            .onAppear{
                if type == "VISA" {
                    color1 = .orange
                    color2 = .red
                }else if type == "MASTER CARD" {
                    color1 = .blue
                    color2 = .green
                }else {
                    color1 = .gray
                    color2 = .blue
                }
                
            }
    }
}
