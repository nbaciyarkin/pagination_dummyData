//
//  ViewController.swift
//  Pagination_project
//
//  Created by Yarkın Gazibaba on 19.04.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var listView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var uploadedList: [Article] = []
    var articleList: [Article] = []
    var filteredArticleList: [Article] = []
    
    var page = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var article: Article
        
        for i in 0..<105 {
            
            article = Article(header: "Header\(i)", description: "Description\(i)")
            
            articleList.append(article)
            
            if i < 20 {
                uploadedList.append(article)
            }
        }
        
        filteredArticleList.append(contentsOf: articleList)
        listView.reloadData()
    }
    
    func addItemToList() {
        
        if(((page + 1)*20)  < articleList.count) {
            for i in (((page + 1)*20)..<((page + 2)*20)){
                
                if i < filteredArticleList.count{
                    uploadedList.append(filteredArticleList[i])
                }
            }
            page += 1
            listView.reloadData()
        }
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height * 0.9) {
            addItemToList()
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        page = 0
        
        filteredArticleList = searchText.isEmpty ? articleList: articleList.filter({ Article in
            
            return Article.headher?.range(of: searchText, options: .caseInsensitive) != nil || Article.description?.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        uploadedList.removeAll()
        
        for i in 0..<filteredArticleList.count {
            if i < 20 {
                uploadedList.append(filteredArticleList[i])
            }
        }
        listView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uploadedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TV_CELL", owner: self, options: nil)?.first as! TV_CELL
        
        cell.lbl_header.text = uploadedList[indexPath.row].headher
        cell.lbl_description.text = uploadedList[indexPath.row].description
        return cell
    }
    
    
}





