//
//  FloatingViewTableViewController.swift
//  Motion Shadows Demo
//
//  Created by Michael Nachbaur on 2019-04-23.
//  Copyright © 2019 Michael Nachbaur. All rights reserved.
//

import UIKit

class FloatingViewTableViewController: UIViewController, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = "Cell \(indexPath.row)";
        cell.detailTextLabel?.text = "Detail for \(indexPath.row)";

        return cell
    }
}
