//
//  DogFactUIView.swift
//  SwiftTry
//
//  Created by Anika Tabasum on 6/24/25.
//

import SwiftUI

struct DogFactUIView: View {
    @StateObject  var viewModel = DogFactViewModel()//ask chatagpt why private cant acess throw  #Preview
    var body: some View {
        VStack(spacing:20){
            if viewModel.isLoading{
                ProgressView("Loading Dog fact")
            }
            else if let error = viewModel.errorMessage{
                Text("Error:\(error)")
                    .foregroundColor(.red)
            }
            else{
                Text(viewModel.fact).font(.title)
                    .padding()
            }
            Button ("Get New Dog Fact"){viewModel.fetchFact()}.padding()
        }
        .onAppear{
            viewModel.fetchFact()
        }.padding()
    }
}

#Preview {
    DogFactUIView(viewModel: DogFactViewModel())
}
