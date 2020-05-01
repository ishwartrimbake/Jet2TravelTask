//
//  ArticleTableViewCell.swift
//  Jet2TravelAssignment
//
//  Created by bpn on 29/04/20.
//  Copyright © 2020 Jet2Travel. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet var userProfileImageView: UIImageView!{
        didSet{
            NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil)
        }
    }
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userDesignationLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    
    @IBOutlet var articleImageView: UIImageView!
    
    @IBOutlet var articleContentLabel: UILabel!
    @IBOutlet var articleTitleLabel: UILabel!
    @IBOutlet var articleURLLabel: UILabel!
    
    @IBOutlet var articleLikesLabel: UILabel!
    @IBOutlet var articleCommentsLabel: UILabel!
    
    var modelArticle : ArticleModel?{
        didSet{
            articleConfiguration()
         }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyCircularEffectToAvtar()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
          
    }
    func applyCircularEffectToAvtar(){
        self.userProfileImageView.layer.cornerRadius = self.userProfileImageView.bounds.width/2
        self.userProfileImageView.clipsToBounds = true
        self.userProfileImageView.layer.borderWidth = 1
        self.userProfileImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func articleConfiguration(){
        userNameLabel.text = modelArticle?.user?[0].name?.description
        userDesignationLabel.text = modelArticle?.user?[0].designation?.description
        articleContentLabel.text = modelArticle?.content?.description
         setImageToview(urlToImage: (modelArticle?.user?[0].avatar!.description)!, targetImageView: userProfileImageView)
        articleLikesLabel.text = "\(calculateLikesandComments(value: (modelArticle?.likes!.description)!)) Likes"
        articleCommentsLabel.text = "\(calculateLikesandComments(value: (modelArticle?.comments!.description)!)) Comments"
       
        
        if (modelArticle?.media!.count ?? 0 > 0)
        {
            articleTitleLabel.text = modelArticle?.media?[0].title?.description
            articleURLLabel.text = modelArticle?.media?[0].url?.description
            setImageToview(urlToImage: (modelArticle?.media?[0].image!.description)!, targetImageView: articleImageView)
            articleImageView.isHidden = false;
        }else{
            articleTitleLabel.text = nil
            articleURLLabel.text = nil
            articleImageView.isHidden = true;
        }
        
        
    }
    
    func setImageToview(urlToImage : String ,targetImageView:UIImageView){
        let session = URLSession.shared
        let imageURL = URL(string: urlToImage)
        let task = session.dataTask(with: imageURL!) { (data, response, error) in
            guard error == nil else {
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    targetImageView.image = image
                }
            }
        }
        task.resume()
    }
    
    func calculateLikesandComments(value:String)->String{
        var res : Double = 0
        if let doubleNumber = Double(value) {
            res = (doubleNumber < 1000) ? doubleNumber : doubleNumber / 1000
        }
        return String(format: "%.1f",ceil(res*100)/100);
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsUpdateConstraints()
        self.updateConstraintsIfNeeded()
    }
}
