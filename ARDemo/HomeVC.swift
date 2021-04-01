//
//  HomeVC.swift
//  ARDemo
//
//  Created by JD Patel on 12/09/19.
//  Copyright © 2019 JD. All rights reserved.
//

import UIKit
import QuickLook
import ARKit

class HomeVC: UIViewController {
    
    private let homeCellId = "homeCellId"

    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    let furnitures = ["Sofa", "Table", "Brown_Table", "Chair", "Donut"]
    var selectedFurniture = "Sofa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "AR Furnitures"
        
        
        setupTableView()
        
    }
    
    
    private func setupTableView() {
        
        tableView.register(HomeCell.self, forCellReuseIdentifier: homeCellId)
        
        view.addSubview(tableView)
        
        [tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)].forEach{ $0.isActive = true }
        
    }
    
    
}



extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return furnitures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellId, for: indexPath) as! HomeCell
        
        cell.textLabel?.font = .systemFont(ofSize: 21)
        cell.textLabel?.text = furnitures[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        selectedFurniture = furnitures[indexPath.row]
        
        let previewController = QLPreviewController()
        previewController.dataSource = self
        present(previewController, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    
}




extension HomeVC: QLPreviewControllerDataSource {    
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int { return 1 }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        guard let path = Bundle.main.path(forResource: selectedFurniture, ofType: "reality") else { fatalError("couldn't find the rcproject file.") }
        let url = URL(fileURLWithPath: path)
        let item = ARQuickLookPreviewItem(fileAt: url)
        
        return item
        
    }
    
    
}
