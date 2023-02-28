//
// .swift
//  StudentPortal
//
//  Created by devi-pt6261 on 25/02/23.
//

import Foundation

struct ResultGeneratorDelegate{
    func displayEntireResults(result:[Result]){
        for i in 0...(result.count-1){
            print("\nsemnum:\(result[i].semesterNum) \n\nsemResults:\n\(displayResult(result:result[i].semResults)) \ngpa:\(round((result[i].gpa*100)/100.0))")
        }

        }
        func displayResult(result:[Semester])->String{
            var str=""
            for i in 0...(result.count-1){
                str += String(describing: result[i])
                str += "\n......................\n"
            }
            return str
        }
        
    

}
