//
//  ViewController.swift
//  P2-A Hands On Exam
//
//  Created by Jamie Rose Aguinaldo on 12/12/2016.
//  Copyright © 2016 Jamie Rose Aguinaldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     * Values must be saved to a constant
     * Error messages will be saved to a tuple
     * String interpolation
     * Saving of values to an empty array
     * Fetching of values from an array
     * Using of control transfer statement
     * Using of IBOutlet Collection
     */
    
    @IBOutlet weak var txtFulllName: UITextField!
    @IBOutlet weak var txtCollege: UITextField!
    @IBOutlet weak var txtDepartment: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var txtBirthday: UITextField!
    
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet var lblForDetails: [UILabel]!
    
    let errorMessages = ("Please fill up all fields", "College not found")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveStudentDetails(_ sender: Any) {
        let fullName = txtFulllName.text!
        let college:String = txtCollege.text!
        var department = txtDepartment.text!
        let yearLevel = txtYear.text!
        let birthday = txtBirthday.text!
        var detailsArr = [String]()
        
        if fullName.isEmpty || college.isEmpty || department.isEmpty || yearLevel.isEmpty || birthday.isEmpty {
            lblError.isHidden = false
            lblError.text = "Error: \(errorMessages.0)"
            
        } else {
            switch college {
            case "CITE":
                department = "None"
                fallthrough
            case "CMA", "CAS", "CEA", "CSS", "CHS":
                lblError.isHidden = true
                
                detailsArr.append(fullName)
                detailsArr.append(college)
                detailsArr.append(department)
                detailsArr.append(yearLevel)
                detailsArr.append(birthday)
                
                for x in 0...detailsArr.count-1 {
                    lblForDetails[x].text = detailsArr[x]
                }
                
            default:
                lblError.isHidden = false
                lblError.text = "Error: \(errorMessages.1)"
                
                for y in 0...lblForDetails.count-1 {
                    lblForDetails[y].text = ""
                }
            }
        }
        
        txtFulllName.text = ""
        txtCollege.text = ""
        txtDepartment.text = ""
        txtYear.text = ""
        txtBirthday.text = ""
    }
}

