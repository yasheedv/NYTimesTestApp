//
//  NewsDetailsViewController.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var news = NewsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    func setupTableView() {
        tableView.register(cellType: NewsDetails.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = TableCellHeight.newsDetail.rawValue
    }
}

extension NewsDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let imageCell = tableView.dequeueReusableCell(withIdentifier: "NewsDetails",
                                                            for: indexPath) as? NewsDetails
        else {
            assertionFailure("DequeueReusableCell failed while casting in NewsDetailsViewController")
            return UITableViewCell()
        }
        imageCell.updateUI(news)
        return imageCell
    }
}
