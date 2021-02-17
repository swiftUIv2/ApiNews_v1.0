//
//  NewViewModel.swift
//  ApiNews_v1.0
//
//  Created by emm on 16/02/2021.
//

import Foundation
import Combine


protocol NewsViewModel {
    func getArticles()
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
    
    private let service: NewsService
    
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink { res in
                switch res {
                    
                    case .finished:
                        self.state = .success(content: self.articles)
                        // send back the articles
                    
                        
                    case .failure(let error):
                        self.state = .failed(error: error)
                        // send back the error
                }
                
            } receiveValue: { response in
                self.articles = response.articles
            }
        
        self.cancellables.insert(cancellable)
    }
}
