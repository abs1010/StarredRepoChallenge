//
//  repoDataProvider.swift
//  StarredRepoChallenge
//
//  Created by Alan Silva on 02/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation

enum errorCodes: Error {
    case noDataAvailable
    case canNotProccessData
}

protocol repoDataProviderDelegate : class {
    func successOnLoadingRepositories(repo: [Item])
    func errorOnOnLoadingRepositories(error: errorCodes)
}

fileprivate let BASE_URL = "https://api.github.com/search/repositories?q=language:swift&sort=stars"
fileprivate let LANGUAGE = "swift"
fileprivate let resourceString = "\(BASE_URL)q=language:\(LANGUAGE)&sort=stars"

class repoDataProvider {
    
    weak var delegate : repoDataProviderDelegate?
    
    func getMostStarredRepos(completion: @escaping (Result<[Item], errorCodes>) -> Void) {
        
        guard let url = URL(string: resourceString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                self.delegate?.errorOnOnLoadingRepositories(error: .noDataAvailable)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let repoHeader = try decoder.decode(Repo.self, from: jsonData)
                
                if let repoResults = repoHeader.items {
                    completion(.success(repoResults))
                    self.delegate?.successOnLoadingRepositories(repo: repoResults)
                }
            }catch{
                completion(.failure(.canNotProccessData))
                self.delegate?.errorOnOnLoadingRepositories(error: .canNotProccessData)
            }
            
        }.resume()
        
    }
    
}
