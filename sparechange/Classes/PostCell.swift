//
//  PostCell.swift
//  sparechange
//
//  Created by Charlene Angeles on 11/19/17.
//  Copyright © 2017 charangeles. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    
    
    @IBOutlet weak var postWebsite: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postCaptionLabel: UILabel!
    
    
    
    var post: Post! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        self.postImageView.image = post.image
        postCaptionLabel.text = post.caption
        postWebsite.text=post.website
    }
}




















