//
//  ViewController.swift
//  Time Visualizer
//
//  Created by Safa Falaqi on 18/12/2021.
//

import UIKit
import CoreData

var days = Week.weekDays

class DayViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource,TextChangeDelegate{
    
    
    

    let manageObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    @IBOutlet weak var dailyTable: UITableView!
    var dayCD = [TimeVisualizer]()
    var selected = 0
    var selectedIndexPath:IndexPath?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        retriveData()
        scrollCell()
    }
    
  
    
    func retriveData(){
        let request: NSFetchRequest<TimeVisualizer> = TimeVisualizer.fetchRequest()
        do{
            dayCD = try manageObjectContext.fetch(request)
           
        }catch{
            print("\(error)")
        }
        
    }

//    //https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/handling_uikit_gestures/handling_swipe_gestures
//    @objc func swipeHandler(_ gestureRecognizer : UISwipeGestureRecognizer) {
//        if gestureRecognizer.state == .ended {
//            // Perform action.
//
//        }
//    }
//

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 48
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath) as! DaysTableViewCell
        
        if indexPath == selectedIndexPath {
            cell.layer.masksToBounds = true
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor.white.cgColor
            
        }else {
            cell.layer.masksToBounds = false
            cell.layer.borderWidth = 0
            cell.layer.borderColor = UIColor.clear.cgColor
        }
        
        cell.cellDelegate = self
       
        cell.noteField!.text = days[selected].timeInDay[indexPath.row].note
        cell.timeLabel!.text = days[selected].timeInDay[indexPath.row].time
        
        
        cell.indexPath = indexPath
        
        return cell
    }
    
    
    func didChangeText(text: String, indexPath:IndexPath) {
        
        days[selected].timeInDay[indexPath.row].note = text

        let item = NSEntityDescription.insertNewObject(forEntityName: "TimeVisualizer", into: manageObjectContext) as! TimeVisualizer
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    //to set the array to view picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected = row
        dailyTable.reloadData()
    }
    
    //to set the color of text to white in view picker
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: days[row].name, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    //will ask user to ether start new day or add new keyword or go back
    @IBAction func addPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Start New Week?", message: "Choose to start a new week and remove data from the previous one", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Add keywords", style: .default, handler: { action in
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "keywords" ) as! KeywordViewController
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Go Back", style: .destructive, handler: { action in
            //here will scroll to current hour
            
        }))
        alert.addAction(UIAlertAction(title: "Add New Week", style: .default, handler: { action in
            self.addNewWeek()
        }))
        
        self.present(alert, animated: true)
        
    }
    
    func scrollCell(){
        let hour = Calendar.current.component(.hour, from: Date())
               print(hour)
               let minutes = Calendar.current.component(.minute, from: Date())
               let minNum = Int(minutes)
                print(minNum)
               var scrollNum = ( hour * 2 ) + 1
               //scrollNum = (scrollNum * 2)+1
               if(minNum>30){scrollNum+=1}
               selectedIndexPath = IndexPath(row: scrollNum - 1, section: (self.dailyTable.numberOfSections - 1))
               //tableView.scrollToRow(at: indexPath, at: .top, animated: true)
               self.dailyTable.scrollToRow(at: selectedIndexPath!, at: .top, animated: true)
               dailyTable.selectRow(at: selectedIndexPath, animated: true, scrollPosition: .none)
      
    }
    
    func addNewWeek(){
        
        //delete all data and start again
        for i in 0...days.count-1{
            for j in 0...days[i].timeInDay.count - 1{
                days[i].timeInDay[j].note = ""
            }
            dailyTable.reloadData()
        }
    }
    
    
}

