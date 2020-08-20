//
//  File.swift
//  
//
//  Created by Home Dudycz on 20/08/2020.
//

import Foundation

// Filters given data array using provided filter. To use it, please implement DataFilter that would perform filtering, and use it with this data source.
open class FilteredDataSource<DataType, FilterType: DataFilter> where FilterType.DataType == DataType {
    
    public var allData: [DataType]  { didSet { filterArray() } }
    public var filter:  FilterType? { didSet { filterArray() } }

    @CurrentValue
    public private(set) var filteredData: [DataType]

    private func filterArray() {
        filteredData = filter?.filter(data: allData) ?? allData
    }
    
    public init(allData: [DataType] = [], filter: FilterType? = nil) {
        self.allData = allData
        self.filter  = filter
        self.filteredData = filter?.filter(data: allData) ?? allData
    }
    
}

public protocol DataFilter {
    associatedtype DataType
    func filter(data: [DataType]) -> [DataType]
}
