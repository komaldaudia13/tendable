//
//  InspectionListViewController.swift
//  mobileAppTest
//
//  Created by Komal Daudia on 30/07/24.
//

import UIKit

class InspectionListViewController: UITableViewController {
    let viewModel = InspectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.inspectionStarted = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.showError = { [weak self] message in
            self?.showAlert(message: message)
        }
        
        viewModel.startInspection()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.inspection?.survey.categories.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InspectionCell", for: indexPath)
        let category = viewModel.inspection?.survey.categories[indexPath.row]
        cell.textLabel?.text = category?.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInspectionDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! InspectionDetailViewController
                destinationVC.category = viewModel.inspection?.survey.categories[indexPath.row]
            }
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

