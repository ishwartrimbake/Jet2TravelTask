//
//  ArticleViewControllerExtenstion.swift
//  Jet2TravelAssignment
//
//  Created by bpn on 29/04/20.
//  Copyright © 2020 Jet2Travel. All rights reserved.
//

import UIKit

extension ArticleViewController:UITableViewDataSource, UITableViewDelegate
{
    // MARK: - Table view datasource method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleTableData?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        checkForLastCell(with: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleTableViewCell
        let modelArticle = articleTableData?[indexPath.row];
        cell.modelArticle = modelArticle
        return cell
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }

    private func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       return UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        activityIndicator.start {
            DispatchQueue.global(qos: .utility).async {
                sleep(3)
                DispatchQueue.main.async { [weak self] in
                    self?.activityIndicator.stop()
                }
            }
        }
    }
}

extension ArticleViewController{
    // TableViewSetUp
    func tableViewSetup()  {
        articleTableView.dataSource = self
        articleTableView.delegate = self
    }
    // Checking Cell
    private func checkForLastCell(with indexPath:IndexPath) {
        if indexPath.row == (articleTableData!.count - 1) {
            pageIndex+=1
            pageSetup()
            }
        }
    
    // Initial page settings
    func pageSetup()  {
        
       // showActivityIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
         //   self.tableViewSetup()
            self.getArticle(pageIndex: self.pageIndex)
           // self.closureSetUp()
           // self.hideActivityIndicator()
        }
    }
    
   
    
}
