//
//  ArticleViewModel.swift
//  Jet2TravelAssignment
//
//  Created by bpn on 29/04/20.
//  Copyright © 2020 Jet2Travel. All rights reserved.
//

import Foundation
struct ArticleViewModel
{
    func getArticle(pageIndex: Int, completion: @escaping(_ result:[ArticleModel]?)-> Void)
    {
        let articleRequest = ArticleRequest(Page: pageIndex, Limit: 10)
        let articleResource = ArticleResource()
        articleResource.getArticle(articleRequest: articleRequest) { (articleApiResponse) in
            _ = completion(articleApiResponse)
        }
    }
    
}
