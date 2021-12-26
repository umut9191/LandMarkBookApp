//
//  ViewController.swift
//  LandMarkBookApp
//
//  Created by Mac on 26.12.2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenlandmarkName = ""
    var chosenRelatedImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "Landmark Book"
        tableView.delegate = self
        tableView.dataSource = self
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stone Henge")
        landmarkNames.append("Tac Mahal")
        
        landmarkImages.append(UIImage(named: "colosseum.jpg")!)
        landmarkImages.append(UIImage(named: "greatWall.jpg")!)
        landmarkImages.append(UIImage(named: "Kremlin.jpg")!)
        landmarkImages.append(UIImage(named: "stoneHenge.jpg")!)
        landmarkImages.append(UIImage(named: "tacmahal.jpg")!)
    }

    // row editting
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //if user want to swipe to left for deleting than;
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            //removing also from tableView;
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    //tableView Cell specified
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkImages.count
    }
    //tableView filling rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    //tableView when row selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //chosen row infos;
         chosenlandmarkName = landmarkNames[indexPath.row]
         chosenRelatedImage = landmarkImages[indexPath.row]
        //when a row selected we gonna perform segue;
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    //when segue performing;
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandMarkName = chosenlandmarkName
            destinationVC.selectedLandMarkImage = chosenRelatedImage
        }
    }
}

