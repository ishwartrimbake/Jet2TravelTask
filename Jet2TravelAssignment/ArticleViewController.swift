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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getArticle(pageIndex: 1);
        
    }

    private func getArticle(pageIndex : Int){
        articleViewModel.getArticle(pageIndex: pageIndex) { (articleApiResponse) in
            if(articleApiResponse != nil)
            {
                self.articleTableData = articleApiResponse
                print("response:- \(String(describing: self.articleTableData))");

               DispatchQueue.main.async {
                    self.articleTableView.reloadData()
                }
            }
        }
        
    }
}

