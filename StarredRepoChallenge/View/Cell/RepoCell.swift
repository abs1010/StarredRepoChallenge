//
//  RepoCell.swift
//  StarredRepoChallenge
//
//  Created by Alan Silva on 03/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit
import SDWebImage

class RepoCell: UITableViewCell {
    
    @IBOutlet weak var repoNaME: UILabel!
    @IBOutlet weak var numberOfStars: UILabel!
    @IBOutlet weak var repoUserPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(repo: Item){
        
        self.repoNaME.text = repo.name
        
        if let stars = repo.stargazersCount {
            self.numberOfStars.text = String(stars)
        }
        if let urlString = repo.owner?.avatarURL {
            self.repoUserPic.sd_setImage(with: URL(string: ("\(urlString)")), placeholderImage: UIImage(named: "placeholder"))
            self.repoUserPic.layer.cornerRadius = self.repoUserPic.frame.height / 2
        }else{
            self.repoUserPic.image = UIImage(named: "placeholder")
        }
        
    }
    
}
