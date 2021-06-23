import UIKit

//Config
var text: String = "aaba kouq bux"
let repeatLimit: Int = 3

//Main
let unwantedCharacters: [Character] = pickUnwantedCharacters(text: text, repeatLimit: repeatLimit)
removeUnwantedCharacters(text: &text, unwantedCharacters: unwantedCharacters)
//Trims whitespace from a result text.
let result = text.trimmingCharacters(in: .whitespacesAndNewlines)
print(result)

func removeUnwantedCharacters(text: inout String, unwantedCharacters: [Character]) {
    //Removes unwanted characters from our text.
    for char in unwantedCharacters {
        text = text.replacingOccurrences(of: String(char), with: "", options: NSString.CompareOptions.literal, range: nil)
    }
}

func pickUnwantedCharacters(text: String, repeatLimit: Int) -> [Character] {
    var dictionary: [Character: Int] = [:]
    var unwantedCharacters = Array<Character>()

    for char in text {
        //Ignores spaces.
        if(char != " "){
            //Checks if current char already exists in the dictionary.
            if(dictionary[char] == nil) {
                dictionary[char] = 1
            } else {
                //Adds 1 to its value since it already exists in the dictionary.
                dictionary.updateValue((dictionary[char] ?? 0) + 1, forKey: char)
                //Checks if char already repeated more than the limit that we set.
                //Also checks if we already marked it as unwanted.
                if((dictionary[char] ?? 0) >= repeatLimit && !unwantedCharacters.contains(char)) {
                    unwantedCharacters.append(char)
                }
            }
        }
    }
    
    return unwantedCharacters
}
