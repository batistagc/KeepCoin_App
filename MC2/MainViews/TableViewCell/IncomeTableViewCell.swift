//
//  IncomeTableViewCell.swift
//  MC2
//
//  Created by Gabriel Batista Cristiano on 05/08/21.
//

import UIKit

class IncomeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameIncome: UILabel!
    @IBOutlet weak var valueIncome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
