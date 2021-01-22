//
//  BeerSearch.swift
//  BeerApp
//
//  Created by Christian Shirichena on 1/21/21.
//

import Foundation
import UIKit

//struct BeerSearch {
//    var beer: [Beer] = []
//    let searchController = UISearchController.init(searchResultsController: <#T##UIViewController?#>)
//    var filteredBeer: [Beer] = []
//
//    // 1. UISearchController property informs class of UISearchBar text changes
//    let searchController.searchResultsUpdater = self
//
    
    
    
//}

//class MasterViewController: UIViewController {
//  @IBOutlet var tableView: UITableView!
//  @IBOutlet var searchFooter: SearchFooter!
//  @IBOutlet var searchFooterBottomConstraint: NSLayoutConstraint!
//
//  var candies: [Candy] = []
//  let searchController = UISearchController.init(searchResultsController: nil)
//  var filteredCandies: [Candy] = [] // property holds candies searched
//
//
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    // populate tableview with candies
//    candies = Candy.candies()
//    // 1. UISearchController property informs class of UISearchBar text changes
//    searchController.searchResultsUpdater = self
//    // 2. Prevents obscuring of view
//    searchController.obscuresBackgroundDuringPresentation = false
//    // 3. setting placeholder to specific search item
//    searchController.searchBar.placeholder = "Search Candies"
//    // 4. adds search bar
//    navigationItem.searchController = searchController
//    // 5. when user moves to another view search bar moves from screen
//    definesPresentationContext = true
//  }
//
//  override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//
//    if let indexPath = tableView.indexPathForSelectedRow {
//      tableView.deselectRow(at: indexPath, animated: true)
//    }
//  }
//
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    guard
//      segue.identifier == "ShowDetailSegue",
//      let indexPath = tableView.indexPathForSelectedRow,
//      let detailViewController = segue.destination as? DetailViewController
//      else {
//        return
//    }
//
//    let candy = candies[indexPath.row]
//    detailViewController.candy = candy
//  }
//  // tracks if searchbar is empty
//  var isSearchBarEmpty: Bool {
//    return searchController.searchBar.text?.isEmpty ?? true
//  }
//  // filters candy based on searchText and puts results into filteredCandies
//  func filterContentForSearchText(_ searchText: String, category: Candy.Category? = nil) {
//    filteredCandies = candies.filter { (candy: Candy) -> Bool in return candy.name.lowercased().contains(searchText.lowercased())
//    }
//    tableView.reloadData()
//  }
//
//}
//// MARK:- Table Views (DataSource) calls
//extension MasterViewController: UITableViewDataSource {
//  func tableView(_ tableView: UITableView,
//                 numberOfRowsInSection section: Int) -> Int {
//    return candies.count
//  }
//
//  func tableView(_ tableView: UITableView,
//                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
//                                             for: indexPath)
//    let candy = candies[indexPath.row]
//    cell.textLabel?.text = candy.name
//    cell.detailTextLabel?.text = candy.category.rawValue
//    return cell
//  }
//}
//// MARK: - Search controller calls (UISearchResultsUpdating protocol)
//
//extension MasterViewController: UISearchResultsUpdating {
//func updateSearchResults(for searchController: UISearchController) {
//  }
//}
