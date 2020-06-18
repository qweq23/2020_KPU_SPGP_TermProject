//
//  BookcaseTableViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/05/28.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class BookcaseTableViewController: UITableViewController {
    
    var myBooks: [Book] = []
    let bookManager = BookManager()

    @IBAction func goToMain(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bookManager.loadFromFile()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookManager.books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell
        
//        cell.coverImage = myBooks[indexPath.row].image
//
//        cell.title = myBooks[indexPath.row].title
//        cell.author = myBooks[indexPath.row].author
//        cell.publisher = myBooks[indexPath.row].publisher
        
        cell.coverImage = bookManager.books[indexPath.row].image
        
        cell.title = bookManager.books[indexPath.row].title
        cell.author = bookManager.books[indexPath.row].author
        cell.publisher = bookManager.books[indexPath.row].publisher
        
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
