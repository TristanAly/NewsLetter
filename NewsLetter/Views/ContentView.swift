//
//  ContentView.swift
//  NewsLetter
//
//  Created by Tristan Aly on 30/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                            .foregroundColor(post.points > 200 ? .green : .red)
                        
                        Text(post.title)
                    }
                }
            }.listStyle(.inset)
                .navigationTitle("NewsLetter")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//Post(id: "1", title: "Hello"),
//Post(id: "2", title: "Bonjour"),
//Post(id: "3", title: "Hola"),
//]
