//
//  ViewController.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    let refreshController = UIRefreshControl()
    lazy var activityIndicator: UIActivityIndicatorView = {
        let controller = UIActivityIndicatorView(style: .gray)
        controller.center = view.center
        return controller
    }()
    var news = [NewsModel]()
    var selectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getNews()
        self.title = "NY Times Most Popular"
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Refresh control target
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
        getNews()
    }
    // TableView intitialization
    func setupTableView() {
        tableView.register(cellType: NewsTableViewCell.self)
        tableView.estimatedRowHeight = TableCellHeight.newsCell.rawValue
        tableView.rowHeight = UITableView.automaticDimension
        refreshController.addTarget(self, action: #selector(refreshControlAction(_:)), for: .valueChanged)
        tableView.refreshControl = refreshController
        tableView.accessibilityIdentifier = "newsTableView"
    }
    // MARK: - Service call
    func getNews() {
        showActivityIndicator()
        let networkCall = NetworkServiceCalls()
        networkCall.getNews { [unowned self] (state) in
            self.removeActivityIndicator()
            switch state {
            case .succes(let response as NewsResultParser):
                self.news = response.result
                if self.refreshController.isRefreshing {
                    self.tableView.reloadData()
                    self.refreshController.endRefreshing()
                } else {
                    self.tableView.horizontalAnimation()
                }
            case .failure(let error):
                self.showAlert(error.description)
            default:
                break
            }
        }
    }
    // MARK: - Show alert controller
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Sorry",
                                                message: message,
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        let retryAction = UIAlertAction(title: "Retry",
                                       style: .default) { (_) in
                                        self.getNews()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(retryAction)
        present(alertController,
                animated: true,
                completion: nil)
    }
    func showActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    func removeActivityIndicator() {
        activityIndicator.removeFromSuperview()
    }
    // MARK: - Handle segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewsDetailsViewController {
            destination.news = news[selectedIndex]
        }
    }
}

// MARK: - Extension for TableViewDataSource handling

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell",
                                                           for: indexPath) as? NewsTableViewCell
        else {
            assertionFailure("DequeueReusableCell failed while casting in NewsViewController")
            return UITableViewCell()
        }
        newsCell.accessibilityIdentifier = "newsCell\(indexPath.row)"
        newsCell.selectionStyle = .none
        newsCell.backgroundColor = UIColor.clear
        newsCell.accessoryType = .disclosureIndicator
        let data = news[indexPath.row]
        newsCell.updateUI(data)
        return newsCell
    }
}

// MARK: - Extension for TableViewDelegate handling
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        selectedIndex = indexPath.row
        performSegue(withIdentifier: SegueIdentifiers.newsDetails.rawValue, sender: self)
    }
}
