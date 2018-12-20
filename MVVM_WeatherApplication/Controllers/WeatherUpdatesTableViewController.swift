//
//  WeatherUpdatesTableViewController.swift
//  MVVM_WeatherApplication
//
//  Created by Pranalee Jadhav on 12/11/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import UIKit

class WeatherUpdatesTableViewController: UITableViewController, NewWeatherUpdate, SettingsChange {

    private var weatherListViewModel = WeatherListViewModel()
    private var dataSource: WeatherDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.tableView.tableFooterView = UIView()
        
        self.dataSource = WeatherDataSource(weatherListViewModel)
        self.tableView.dataSource = dataSource
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    func newWeatherAdded(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    func settingsUpdated(vm: SettingsViewModel) {
        
        weatherListViewModel.updateUnit(to: vm.selectedUnit)
        
        self.tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToSettings" {
            configureSettingsSegue(segue: segue)
        } else if segue.identifier == "goToAddCity" {
            configureAddCitySegue(segue: segue)
        }
        
       
    }
    
    func configureSettingsSegue(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation Controller not found")
        }
        
        guard let vc = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("view Controller not found")
        }
        vc.delegate = self
    
    }
    
    
    func configureAddCitySegue(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation Controller not found")
        }
        
        guard let vc = nav.viewControllers.first as? AddCityViewController else {
            fatalError("view Controller not found")
        }
        vc.delegate = self
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
