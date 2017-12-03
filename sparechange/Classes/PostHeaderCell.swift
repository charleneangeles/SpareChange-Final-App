//
//  PostHeaderCell.swift
//  sparechange
//
//  Created by Charlene Angeles on 11/19/17.
//  Copyright © 2017 charangeles. All rights reserved.
//
import UIKit

class PostHeaderCell: UITableViewCell
{
    
    @IBOutlet weak var lblCharityName: UILabel!
    
    var post: Post! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        lblCharityName.text = post.postedBy.charityName
        
    }
    
}











