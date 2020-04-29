//
//  ArticleViewControllerExtenstion.swift
//  Jet2TravelAssignment
//
//  Created by bpn on 29/04/20.
//  Copyright © 2020 Jet2Travel. All rights reserved.
//

import UIKit

extension ArticleViewController:UITableViewDataSource
{
    // MARK: - Table view datasource method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleTableData?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleTableViewCell
         return cell
    }
}
