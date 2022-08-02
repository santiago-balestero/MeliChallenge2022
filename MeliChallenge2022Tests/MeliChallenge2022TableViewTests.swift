//
//  MeliChallenge2022TableViewTests.swift
//  MeliChallenge2022Tests
//
//  Created by Santiago Balestero on 30/7/22.
//

import XCTest
@testable import MeliChallenge2022

class MeliChallenge2022TableViewTests: XCTestCase {
    
    private var productsTableViewController: ProductSearchTableViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.productsTableViewController = storyboard.instantiateViewController(withIdentifier: "ProductSearchTableViewController") as? ProductSearchTableViewController
        self.productsTableViewController.loadView()
        self.productsTableViewController.viewDidLoad()
        self.productsTableViewController.searchBar(productsTableViewController.searchBarController.searchBar, textDidChange: "Auto")
    }
    
    func testHasATableView() {
        XCTAssertNotNil(productsTableViewController.tableView)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(productsTableViewController.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(productsTableViewController.responds(to: #selector(productsTableViewController.tableView(_:didSelectRowAt:))))
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(productsTableViewController.tableView.delegate)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(productsTableViewController.tableView.dataSource)
    }
}

