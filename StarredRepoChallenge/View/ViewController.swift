//
//  ViewController.swift
//  StarredRepoChallenge
//
//  Created by Alan Silva on 02/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var refreshControl : UIRefreshControl?
    
    var controller : RepoController = RepoController()
    
    @IBOutlet weak var repoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addRefreshingControl()
        
        self.controller.delegate = self
        self.controller.setupController()
        
        //Delegate and Datasource
        self.repoTableView.delegate = self
        self.repoTableView.dataSource = self
        
        //Register Cells
        self.repoTableView.register(UINib(nibName: "RepoCell", bundle: nil), forCellReuseIdentifier: "RepoCell")

    }
    
    func addRefreshingControl(){
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        self.repoTableView.addSubview(refreshControl!)
        
    }
    
    @objc func refreshList() {
        
        self.refreshControl?.endRefreshing()
        self.controller.loadRepositories()
        self.repoTableView.reloadData()
        
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.controller.getNumberOfRowsInSection()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : RepoCell = tableView.dequeueReusableCell(withIdentifier: "RepoCell") as! RepoCell
        
        cell.setupCell(repo: self.controller.loadRepo(indexPath: indexPath))
        
        return cell
    
    }
    
}

extension ViewController : RepoControllerDelegate {
    
    func successOnLoadingRepositories(repo: [Item]) {
        
        DispatchQueue.main.async {
            self.repoTableView.reloadData()
            print("Passei pelo delegate ViewController")
        }
    
    }
    
    func errorOnOnLoadingRepositories(error: errorCodes) {
        print("Erro ao carregar")
    }
    
}
