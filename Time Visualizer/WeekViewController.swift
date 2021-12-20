//
//  WeekViewController.swift
//  Time Visualizer
//
//  Created by Safa Falaqi on 19/12/2021.
//

import UIKit
import Charts
import CoreData



class WeekViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,TextChangeDelegate {
    
    var keywords = ["swift","ios","algorithm","data structures","uikit","swiftui"]
    var keywordsCount:[Double] = [0.0,0.0,0.0,0.0,0.0,0.0]
    
    func didChangeText(text: String, indexPath: IndexPath) {
        weekTable.reloadData()
    }
    
    @IBOutlet weak var pieChart: PieChartView!
    
    @IBOutlet weak var weekTable: UITableView!
    var selectedIndexPath:IndexPath?
    
    var weekCD:[TimeVisualizer]?
    
    let manageObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        retriveData()
        scrollCell()
       
        updatePieChart()
    }
    
    func updatePieChart(){
        
        pieChart.chartDescription?.text = "Time spended studying different topics"
        var entries = [PieChartDataEntry]()
     
        entries.append(PieChartDataEntry(value: keywordsCount[3],label: "data structures"))//teal
        entries.append(PieChartDataEntry(value: keywordsCount[4],label: "uikit")) //purple
        entries.append(PieChartDataEntry(value: keywordsCount[0],label: "swift")) //green
        entries.append(PieChartDataEntry(value: keywordsCount[2],label: "algorithm")) // teal
        entries.append(PieChartDataEntry(value: keywordsCount[5],label: "swiftui")) //Purple
        entries.append(PieChartDataEntry(value: keywordsCount[1],label: "ios")) //green
        let dataSet = PieChartDataSet(entries: entries, label: nil)
        dataSet.colors = [.systemTeal, .systemPurple, .systemGreen, .systemTeal, .systemPurple, .systemGreen]
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
    }
    
    func retriveData(){
        let request: NSFetchRequest<TimeVisualizer> = TimeVisualizer.fetchRequest()
        do{
            weekCD = try manageObjectContext.fetch(request)
           
        }catch{
            print("\(error)")
        }
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weekCell", for: indexPath) as! WeekTableViewCell
        
        if indexPath == selectedIndexPath {
            cell.layer.masksToBounds = true
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor.white.cgColor
            
        }else {
            cell.layer.masksToBounds = false
            cell.layer.borderWidth = 0
            cell.layer.borderColor = UIColor.clear.cgColor
        }
        
        cell.sunLabel!.text = "Sun:   \(days[0].timeInDay[indexPath.row].note)"
        checkKeyword(note:days[0].timeInDay[indexPath.row].note)
        cell.monLabel!.text = "Mon:   \(days[1].timeInDay[indexPath.row].note)"
        checkKeyword(note:days[1].timeInDay[indexPath.row].note)
        cell.tueLabel!.text = "Tue:   \(days[2].timeInDay[indexPath.row].note)"
        checkKeyword(note:days[2].timeInDay[indexPath.row].note)
        cell.wedLabel!.text = "Wed:   \(days[3].timeInDay[indexPath.row].note)"
        checkKeyword(note:days[3].timeInDay[indexPath.row].note)
        cell.thuLabel!.text = "Thu:   \(days[4].timeInDay[indexPath.row].note)"
        checkKeyword(note:days[4].timeInDay[indexPath.row].note)
        cell.friLabel!.text = "Fri:   \(days[5].timeInDay[indexPath.row].note)"
        checkKeyword(note:days[5].timeInDay[indexPath.row].note)
        cell.satLabel!.text = "Sat:   \(days[6].timeInDay[indexPath.row].note)"
        checkKeyword(note:days[6].timeInDay[indexPath.row].note)
        
        cell.timeLabel!.text = " \(days[0].timeInDay[indexPath.row].time)"
      
        print(keywordsCount)
        updatePieChart()
        return cell
    }
    
    func checkKeyword(note:String){
        
        for i in 0...keywords.count-1{
            if note.contains(keywords[i])
            {
                keywordsCount[i]+=1
            }
        }
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
               selectedIndexPath = IndexPath(row: scrollNum - 1, section: (self.weekTable.numberOfSections - 1))
               //tableView.scrollToRow(at: indexPath, at: .top, animated: true)
               self.weekTable.scrollToRow(at: selectedIndexPath!, at: .top, animated: true)
             weekTable.selectRow(at: selectedIndexPath, animated: true, scrollPosition: .none)
      
    }

}
