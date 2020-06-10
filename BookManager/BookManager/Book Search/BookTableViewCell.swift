//
//  BookTableViewCell.swift
//  BookManager
//
//  Created by kpugame on 2020/06/11.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLable: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    
    var coverImage = UIImage() {
        didSet {
            coverImageView.image = coverImage
        }
    }
    
    var title = String() {
        didSet {
            titleLabel.text = title
        }
    }
    
    var author = String() {
        didSet {
            authorLable.text = author
        }
    }
    
    var publisher = String() {
        didSet {
            publisherLabel.text = publisher
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
