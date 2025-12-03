// Online Swift compiler to run Swift program online

import Foundation
let example_arr = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124".components(separatedBy: ",")
let test_arr = "61-71,12004923-12218173,907895-1086340,61083-74975,7676687127-7676868552,3328-4003,48-59,3826934-3859467,178-235,75491066-75643554,92-115,1487-1860,483139-586979,553489051-553589200,645895-722188,47720238-47818286,152157-192571,9797877401-9798014942,9326-11828,879837-904029,4347588-4499393,17-30,1-16,109218-145341,45794-60133,491-643,2155-2882,7576546102-7576769724,4104-5014,34-46,67594702-67751934,8541532888-8541668837,72-87,346340-480731,3358258808-3358456067,78265-98021,7969-9161,19293-27371,5143721-5316417,5641-7190,28793-36935,3232255123-3232366239,706-847,204915-242531,851-1135,790317-858666".components(separatedBy: ",")


func factors(number: Int) -> [Int] {
    var factors = [Int]()
    for i in 1...Int(number - 1) {
        if number % i == 0 {
            factors.append(i)
        }
    }
    return factors
}

func toEqualSubStringWithLength(str: String, n: Int) -> [String] {
    assert(str.count % n == 0)
    var result = [String]()

    var currentOffset = n
    while currentOffset <= str.count  {
        let index_start = str.index(str.startIndex, offsetBy: currentOffset - n)
        let index_end = str.index(str.startIndex, offsetBy: currentOffset)


        let subString = String(str[index_start..<index_end])

        result.append(subString)

        currentOffset += n
        
    }

    return result
}

func isDup(str: String) -> Bool {
    let factors = factors(number: str.count)

    for factor in factors {
        let subString = toEqualSubStringWithLength(str: str,n: factor)
        if Set(subString).count == 1 {
            return true
        }
    }
    return false

}

print(factors(number: 12))


func generateDup(min: Int, max: Int)-> [Int] {
    var result = [Int]()
    for i in min...max {
        let str = String(i)
        if (str.count < 2) {continue}

        // PART 1
        // let mid = str.index(str.startIndex, offsetBy: str.count / 2)
        // let left = str[..<mid]
        // let right = str[mid...]
        // if left == right {
        //     result.append(i)
        // }

        // PART 2
        if isDup(str: str) {
            result.append(i)
        }
    }
    return result
    
}

func generate(k: Int) -> [Int] {
    let min = Int(pow(10.0, Double(k-1)))
    let max = Int(pow(10.0, Double(k))) - 1
    if k == 0 {return []}
    if k == 1 {return [Int]()}
    return [Int](min...max) + generate(k: k - 1)
}


var allInvalids = Set<Int>()


for example in test_arr {
    let example = example.components(separatedBy: "-")
    let (start, end) = (Int(example[0])!, Int(example[1])!)


    let dups = generateDup(min: start, max: end)
    allInvalids.formUnion(dups)

    print("Processing \(start) to \(end)")
    print(dups)
    print("====")

}


print(allInvalids.reduce(0, +))



