//
//  BookcaseTableViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/05/28.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class BookcaseTableViewController: UITableViewController, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchController.searchBar.text!, scope: "All")
    }
    
    
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet var searchFooter: SearchFooter!
    var filteredBooks = [Book]()
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredBooks = bookManager.books.filter({(book: Book) -> Bool in
            return book.title.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    

    @IBAction func goToMain(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BookDetail" {
            if let detailVC = segue.destination as? BookDetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    detailVC.book = bookManager.books[indexPath.row]
                    print("원본: ", bookManager.books[indexPath.row])
                }
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookManager.loadFromFile()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Books"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        tableView.tableFooterView = searchFooter
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltering() {
            searchFooter.setIsFilteringToShow(filteredItemCount: filteredBooks.count, of: bookManager.books.count)
            return filteredBooks.count
        }
        searchFooter.setNotFiltering()
        return bookManager.books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell
        
        let showedBook: Book
        if isFiltering() {
            showedBook = filteredBooks[indexPath.row]
        } else {
            showedBook = bookManager.books[indexPath.row]
        }
        
        cell.coverImage = showedBook.image
        cell.title = showedBook.title
        cell.author = showedBook.author
        cell.publisher = showedBook.publisher
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
