//: Playground - noun: a place where people can play

import UIKit

func  minimumDistance(numRows: Int, numColumns:Int, area:[[Int]]) -> Int {
    
    enum Direction: Int {
        case left = 0
        case top = 1
        case right = 2
        case bottom = 3
    }
    
    struct Point: Equatable {
        static func == (lhs: Point, rhs: Point) -> Bool {
            return lhs.r == rhs.r && lhs.c == rhs.c;
        }
        
        var r:Int
        var c:Int
        init(row: Int, col:Int) {
            r = row
            c = col
        }
        
        var description: String {
            return String(format: "%d:%d", r,c);
        }
    }
    
    let getValueAt = {(_point:Point) in
        return area[_point.r][_point.c]
    }
    
    let getNeighbour = {(_point:Point, _direction:Direction)-> Point? in
        let c = _point.c;
        let r = _point.r;
        switch _direction {
        case .left:
            return c - 1 >= 0 ? Point(row: r, col: c-1): nil;
        case .top:
            return r-1 >= 0 ? Point(row: r-1, col: c) : nil;
        case .right:
            return c+1 < numColumns ? Point(row: r, col: c+1): nil;
        case .bottom:
            return r+1 < numRows ? Point(row: r + 1, col: c): nil;
            
        }
    }
    
    var pathsToDestiny = [[Point]]();
    
    func traverse(_point:Point, _currentDirection: Direction, path: [Point] ){
        let pointValue = getValueAt(_point);
        guard pointValue != 0 else {
            return;
        }
        
        if pointValue == 9  {
            //Reached destiny; confirm path and see other paths
            pathsToDestiny.append(path);
            return;
        }
        
        var currentPath = path;
        currentPath.append(_point);
        //traverse left
        //Checks, if we traversed throught the neighbour.
        //        if the neighbour exists
        //        if we have already traversed through this nighbour
        if _currentDirection != Direction.right,
            let leftNeighbour = getNeighbour(_point, Direction.left),
                !currentPath.contains(leftNeighbour) {
            traverse(_point: leftNeighbour, _currentDirection: Direction.right, path: currentPath);
        }
        
        if _currentDirection != Direction.bottom,
            let topNeighbour = getNeighbour(_point, Direction.top),
            !currentPath.contains(topNeighbour) {
            traverse(_point: topNeighbour, _currentDirection: Direction.right, path: currentPath);
        }
        
        if _currentDirection != Direction.left,
        let rightNeighbour = getNeighbour(_point, Direction.right),
            !currentPath.contains(rightNeighbour) {
            traverse(_point: rightNeighbour, _currentDirection: Direction.right, path: currentPath);
        }
        
        if _currentDirection != Direction.top,
           let bottomNeighbour = getNeighbour(_point, Direction.bottom),
            !currentPath.contains(bottomNeighbour) {
            traverse(_point: bottomNeighbour, _currentDirection: Direction.right, path: currentPath);
        }
    }
    traverse(_point: Point(row: 0, col: 0), _currentDirection: Direction.right, path: [Point]());
    
    var count:Int = Int(INT_MAX);
    
    print("Possible routes: \(pathsToDestiny.count)");
    pathsToDestiny.forEach { (pointsArray) in
        if(pointsArray.count < count) {
            count = pointsArray.count;
        }
    }
    
    return count;
    
}


func executeTest(i : Int){
    switch i {
    case 3:
        // 1 0 0
        // 1 0 0
        // 1 1 9
        let area3 = [[1, 0 , 0],[1,0,0],[1,1,9]];
        print(minimumDistance(numRows: 3, numColumns: 3, area: area3));
        break;
    case 4:
        // 1 0 0 1
        // 1 1 0 9
        // 0 1 0 1
        // 0 1 1 1
        let area = [[1, 0 , 0, 1],[1, 1, 0, 9],[0, 1, 0, 1], [0, 1, 1, 1]];
        print(minimumDistance(numRows: 4, numColumns: 4, area: area));
        
    case 42:
        // 1 0 0 1
        // 1 1 0 9
        // 0 1 1 1
        // 0 1 1 1
        let area = [[1, 0 , 0, 1],[1, 1, 0, 9],[0, 1, 1, 1], [0, 1, 1, 1]];
        print(minimumDistance(numRows: 4, numColumns: 4, area: area));
        
    case 6:
        let area36 = [[1,1,0,0,1,9],[0,1,1,0,1,1],[0,1,1,0,0,1], [0,0,1,0,1,1], [0,0,1,1,1,0], [0,0,1,1,1,0]];
        print(minimumDistance(numRows: 6, numColumns: 6, area: area36));
        break;

    default:
        break;
    }
    
}

executeTest(i: 6);



























//func minimumDistance(numRows: Int, numColumns:Int, area:[[Int]]) -> Int{
//
//    //assumed: The area is a valid mathemetical 2D array
//    //assumed: NumOfRows >= 0
//    //assumed: NumOfColumns >= 0
//
//
//    //find where (which row) the destination is.
//    let hasDestiny: (Int)-> Bool  = { (row:Int)-> Int?  in
//        return area[row].index(of: 9);
//    };
//
//    var destinationRow = -1;
//    var destinationColumn = -1;
//    for row in 0...numRows {
//        if let column = hasDestiny(row){
//            destinationRow = row;
//            destinationColumn = column;
//            break;
//        }
//    }
//
//    var mutatedArray = area;
//    // move to find the route
//    //Scoring model => when moved towards the route score increases
//    //              ==> when moved away from the destiny, score decreases.
//
//    let moveNext = { () in
//
//
//    }
//
//
//
//
//    return -1;
//}
//
//
//
//func minimumDistance2(numRows: Int, numColumns:Int, area:[[Int]]) -> Int {
//    struct cell {
//        let _row: Int;
//        let _col:Int;
//        let val:Int;
//        var linkedCells: [cell];
//
//        init(row: Int, col:Int, val:Int) {
//            _row = row;
//            _col = col;
//        }
//
//    }
//
//    var grid:[[cell]] = [[cell]]();
//
//
//    for i in 0...numRows {
//        let row = [cell]();
//        for j in 0...numColumns {
//            let cell = cell(row: i, col: j, val: area[i][j]);
//            row.append(cell);
//        }
//        grid.append(row);
//    }
//
//
//
//
//
//}

