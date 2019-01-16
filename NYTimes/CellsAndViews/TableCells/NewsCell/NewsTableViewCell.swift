//
//  NewsTableViewCell.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var reporter: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageOut: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //Updating UI
    func updateUI(_ news: NewsModel) {
        date.text = news.publishedDate
        reporter.text = news.byLine
        titleLabel.text = news.title
        if let firstMedia = news.media.first {
            if let firstMetaData = firstMedia.metaData.first {
                imageOut.imageFromUrl(firstMetaData.url)
            }
        }
    }

    override func prepareForReuse() {
        imageOut.image = nil
    }
}
