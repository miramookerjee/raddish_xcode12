//
//  Pantry.swift
//  raddish
//
//  Created by Mira Mookerjee on 10/24/21.
//

import Foundation
import SwiftUI

class PantryItem: Identifiable {
  
  // MARK: Properties
  var name: String?
  var expiration: NSDate?
  var date: Date?


  init(name: String? = nil, expiration: NSDate? = nil, date: Date? = nil) {
    self.name = name
    self.expiration = expiration
    self.date = date
  }

  func displayName() -> String {
    return name ?? "n/a"
  }
  /*
  // source: https://stackoverflow.com/questions/55733383/parsing-a-csv-file-and-loading-it-into-core-data-in-swift
  func parseCSV (contentsOfURL: NSURL, encoding: String.Encoding, error: NSErrorPointer) -> [(index: Int, name: String, expiration: Float)]? {
     // Load the CSV file and parse it
      let delimiter = ","
      var items:[(index: Int, name: String, expiration: Float)]?

      //if let content = String(contentsOfURL: contentsOfURL, encoding: encoding, error: error) {
      if let content = try? String(contentsOf: contentsOfURL as URL, encoding: encoding) {
          items = []
          let lines:[String] = content.components(separatedBy: NSCharacterSet.newlines) as [String]

          for line in lines {
              var values:[String] = []
              if line != "" {
                  // For a line with double quotes
                  // we use NSScanner to perform the parsing
                  if line.range(of: "\"") != nil {
                      var textToScan:String = line
                      var value:NSString?
                      var textScanner:Scanner = Scanner(string: textToScan)
                      while textScanner.string != "" {

                          if (textScanner.string as NSString).substring(to: 1) == "\"" {
                              textScanner.scanLocation += 1
                              textScanner.scanUpTo("\"", into: &value)
                              textScanner.scanLocation += 1
                          } else {
                              textScanner.scanUpTo(delimiter, into: &value)
                          }

                          // Store the value into the values array
                          values.append(value! as String)

                          // Retrieve the unscanned remainder of the string
                          if textScanner.scanLocation < textScanner.string.count {
                              textToScan = (textScanner.string as NSString).substring(from: textScanner.scanLocation + 1)
                          } else {
                              textToScan = ""
                          }
                          textScanner = Scanner(string: textToScan)
                      }

                      // For a line without double quotes, we can simply separate the string
                      // by using the delimiter (e.g. comma)
                  } else  {
                      values = line.components(separatedBy: delimiter)
                  }

                  // Put the values into the tuple and add it to the items array
                  // right now we have index, name, days to expiren
                  let item = (name: values[0], detail: values[1], price: values[2])
                  items?.append(item)
              }
          }
      }

      return items
  }
  */
}
