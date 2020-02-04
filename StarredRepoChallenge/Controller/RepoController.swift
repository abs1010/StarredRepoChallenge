//
//  RepoController.swift
//  StarredRepoChallenge
//
//  Created by Alan Silva on 03/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation

protocol RepoControllerDelegate : class {
    func successOnLoadingRepositories(repo: [Item])
    func errorOnOnLoadingRepositories(error: errorCodes)
}

class RepoController {

    weak var delegate : RepoControllerDelegate?
    
    var repoArray: [Item] = []
    
    var dataProvider : repoDataProvider?
    
    
    func setupController(){
        
        self.dataProvider = repoDataProvider()
        self.loadRepositories()
        
    }
    
    func loadRepositories(){
        
        self.dataProvider?.getMostStarredRepos(completion: { (result) in
            
            switch result {
            case .failure(let error):
                print(error)
                self.delegate?.errorOnOnLoadingRepositories(error: error)
            case .success(let repositories):
                self.repoArray = repositories
                self.delegate?.successOnLoadingRepositories(repo: repositories)
                print("Oopaaa peguei os dados")
                self.dataProvider?.delegate = self
            }
            
        })
        
    }
    
    func getNumberOfRowsInSection() -> Int {
        
        return self.repoArray.count
        
    }
    
    func loadRepo(indexPath: IndexPath) -> Item {
        
        return self.repoArray[indexPath.row]
        
    }
    
}

extension RepoController : repoDataProviderDelegate {
    func successOnLoadingRepositories(repo: [Item]) {
        self.repoArray = repo
    }
    
    func errorOnOnLoadingRepositories(error: errorCodes) {
        self.delegate?.errorOnOnLoadingRepositories(error: error)
    }
    
}
