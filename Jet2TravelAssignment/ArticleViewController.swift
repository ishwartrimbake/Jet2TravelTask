//
//  ViewController.swift
//  Jet2TravelAssignment
//
//  Created by bpn on 29/04/20.
//  Copyright © 2020 Jet2Travel. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    
    @IBOutlet var articleTableView: UITableView!
    let articleViewModel : ArticleViewModel = ArticleViewModel()
    var articleTableData : [ArticleModel]? = nil
    var pageIndex : Int = 1
    
    var activityIndicator: LoadMoreActivityIndicator!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        articleTableView.estimatedRowHeight = 100
        articleTableView.rowHeight = UITableView.automaticDimension
        articleTableView.tableFooterView = UIView()
        activityIndicator = LoadMoreActivityIndicator(scrollView: articleTableView, spacingFromLastCell: 10, spacingFromLastCellWhenLoadMoreActionStart: 60)

        getArticle(pageIndex: pageIndex);
       NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
    }
   @objc func methodOfReceivedNotification(notification: Notification) {
    self.articleTableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func getArticle(pageIndex : Int){
        articleViewModel.getArticle(pageIndex: pageIndex) { (articleApiResponse) in
            if(articleApiResponse != nil)
            {
                if((self.articleTableData?.count) != nil){
                    self.articleTableData?.append(contentsOf: articleApiResponse!)
                }else{
                    self.articleTableData = articleApiResponse
                }
                
               
                print("response:- \(String(describing: self.articleTableData))");

               DispatchQueue.main.async {
                    self.articleTableView.reloadData()
                }
            }
        }
        
    }
}

