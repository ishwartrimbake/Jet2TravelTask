//
//  ArticleResource.swift
//  Jet2TravelAssignment
//
//  Created by bpn on 29/04/20.
//  Copyright © 2020 Jet2Travel. All rights reserved.
//

import Foundation
struct ArticleResource
{
    func getArticle(articleRequest: ArticleRequest, completion: @escaping(_ result : [ArticleModel]?) -> Void)
    {
        let httpUtility = HttpUtility()

        let articleEndpoint = "\(ApiEndpoints.article)?page=\(articleRequest.Page)&limit=\(articleRequest.Limit)"

        let requestUrl = URL(string:articleEndpoint)!

        httpUtility.getApiData(requestUrl: requestUrl, resultType:ArticleModel.self) { (articleApiResponse) in
                _ = completion(articleApiResponse)
        }
    }
}
