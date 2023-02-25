//
// .swift
//  StudentPortal
//
//  Created by devi-pt6261 on 25/02/23.
//

import Foundation

struct ResultGeneratorDelegate{
    func displayEntireResults(result:resultReturnType){
        for (key,value) in result{
            print("Semester Number: \(key)")
            print("---------------------------------------------------")
            for _ in 0...((value.keys.count)-1){
                
                let p = value.keys[value.keys.startIndex][0]
                let q = value.keys[value.keys.startIndex][1]
                let r = value.keys[value.keys.startIndex][2]
                
                for j in 0...((p.count)-1){
                    print("SUBJECT NAME:\(p[j])                  \nCREDITS:\(q[j])                     \nGRADES:\(r[j])")
                    print("-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-")
                }
                
                print("Gpa of \(key) : \(value.values[value.values.startIndex])")
                print("---------------------------------------------------")
            }
            
        }
        
    }
}
