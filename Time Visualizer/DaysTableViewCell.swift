//
//  DaysTableViewCell.swift
//  Time Visualizer
//
//  Created by Safa Falaqi on 19/12/2021.
//

import UIKit

class DaysTableViewCell: UITableViewCell{

    @IBOutlet weak var noteField: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    var indexPath:IndexPath?
    var cellDelegate: TextChangeDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }

    @IBAction func textDidEnd(_ sender: UITextField) {
        cellDelegate?.didChangeText(text: sender.text!,indexPath: indexPath!)
    }
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        cellDelegate?.didChangeText(text: sender.text!,indexPath: indexPath!)

    }
    
 
    
}
