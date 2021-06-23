import UIKit

//Config
var text = "merhaba nasılsınız . iyiyim siz nasılsınız . bende iyiyim. "
let unwantedCharacters = Set(Array(".:?,-_!'^+%&/()="))

//Main
//Removes whitespace and punctuation characters.
text = text.trimmingCharacters(in: .whitespacesAndNewlines).trimmingCharacters(in: .punctuationCharacters)
let arrayOfCharacters = Array(text)
//Removes unwanted characters.
let filteredText = arrayOfCharacters.reduce("") {
    let str = String($1)
    return $0 + (unwantedCharacters.contains($1) ? "" : str)
}

//Splits text into words.
let words: [String] = filteredText.components(separatedBy: " ")
//Removes empty items from list.
let finalWords = words.filter{ $0.isEmpty == false }
//Calculates the repeats of words.
let result: [(key: String, value: Int)] = calculateRepeatOfWords(words: finalWords)
//Prints results to screen 1 by 1.
for i in 0..<result.count{
    print("\"\(result[i].key)\" \(result[i].value) times repeated.")
}

func calculateRepeatOfWords(words: [String]) -> [(key: String, value: Int)] {
    var dictionary: [String: Int] = [:]

    for word in words {
        //Checks if current word already exists in the dictionary.
        if(dictionary[word] == nil) {
            dictionary[word] = 1
        } else {
            //Adds 1 to its value since it already exists in the dictionary.
            dictionary.updateValue((dictionary[word] ?? 0) + 1, forKey: word)
        }
    }
    
    let sortedByValue = dictionary.sorted { $0.value > $1.value }
    return sortedByValue
}
