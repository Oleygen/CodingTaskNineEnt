//
//  StoryCell.swift
//  NineTestApp
//
//  Created by oleygen-private on 07.05.2022.
//

import Foundation
import UIKit
import SDWebImage

class StoryCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var imageViewWidth: NSLayoutConstraint!
    
    static let identifier = "StoryCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // help to adopt screen size for image
        self.imageViewWidth.constant = UIScreen.main.bounds.width
    }
    
    func setup(_ item: Asset) {
        self.headlineLabel.text = item.headline
        self.abstractLabel.text = item.theAbstract ?? "No abstract given"
        self.lineLabel.text = item.byLine ?? "No line given"
        
        let smallestImage = item.relatedImages?.min(by: { img1, img2 in
            img1.width * img1.height < img2.width * img2.height
        })
        var url: URL?
        if let urlString = smallestImage?.url {
            url = URL(string: urlString)
        }
        self.imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
    }
}
