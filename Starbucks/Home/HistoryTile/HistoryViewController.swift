//
//  ViewController.swift
//  HistoryView
//
//  Created by Andrea Yong on 9/1/24.
//

import UIKit

class HistoryViewController: UITableViewController {
    
//    var sections = [HistorySection]()
    var historyViewModel: HistoryViewModel?
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
//        data()
        fetchTransactions()
    }
    
    func fetchTransactions() {
        HistoryService.shared.fetchTransactions { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let transactions):
                self.historyViewModel?.transactions = transactions
                self.tableView.reloadData()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func style() {
        navigationItem.title = "History"
        tableView.register(HistoryViewCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        
        historyViewModel = HistoryViewModel()
    }
    
//    func data() {
//        let tx1 = Transaction(id: 1, type: "redeemable", amount: "1", date: Date())
//        let tx2 = Transaction(id: 1, type: "redeemable", amount: "2", date: Date())
//        let tx22 = Transaction(id: 1, type: "redeemable", amount: "22", date: Date())
//        let tx3 = Transaction(id: 1, type: "redeemable", amount: "3", date: Date())
//        let tx33 = Transaction(id: 1, type: "redeemable", amount: "33", date: Date())
//        let tx333 = Transaction(id: 1, type: "redeemable", amount: "333", date: Date())
//
//        let firstSection = HistorySection(title: "July", transactions: [tx1])
//        let secondSection = HistorySection(title: "June", transactions: [tx2, tx22])
//        let thirdSection = HistorySection(title: "May", transactions: [tx3, tx33, tx333])
//
//        sections.append(firstSection)
//        sections.append(secondSection)
//        sections.append(thirdSection)
//    }
}

// MARK: Data Source
extension HistoryViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        guard let vm = historyViewModel else { return UITableViewCell() }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? HistoryViewCell else {
            return UITableViewCell()
        }
        
        let section = indexPath.section
        
        var transaction: Transaction
        switch section {
        case 0:
            transaction = vm.sections[0].transactions[indexPath.row]
        case 1:
            transaction = vm.sections[1].transactions[indexPath.row]
        case 2:
            transaction = vm.sections[2].transactions[indexPath.row]
        default:
            return UITableViewCell()
        }
        
//        cell.textLabel?.text = transaction.amount
        cell.transaction = transaction
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = historyViewModel else { return 0 }
        
        switch section {
        case 0:
            return vm.sections[0].transactions.count
        case 1:
            return vm.sections[1].transactions.count
        case 2:
            return vm.sections[2].transactions.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String {
        guard let vm = historyViewModel else { return "" }
        
        switch section {
        case 0:
            return vm.sections[0].title
        case 1:
            return vm.sections[1].title
        case 2:
            return vm.sections[2].title
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = historyViewModel?.sections else { return 0 }
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .tileBrown
    }
}
