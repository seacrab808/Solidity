// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

// contract Monitor {
//     string public name;
//     constructor(string memory _name) {
//         name = _name;
//     }

//     function show() public pure returns(string memory) {
//         return "show";
//     }
// }

// contract SystemUnit {
//     string public name = "XG12";
     
//     function turnOn() public pure returns(string memory) {
//         return "turnOn";
//     }
// }

// contract Computer {
//     Monitor public monitor;                                                                                                                                                                                                                                                                                                                                                                                                                                               
//     SystemUnit public systemUnit;

//     constructor() {
//         monitor = new Monitor("DW12");
//         systemUnit = new SystemUnit();
//     }

//     function getAllNames() public view returns(string memory, string memory) {
//         return(monitor.name(), systemUnit.name());
//     }

//     function start() public view returns(string memory, string memory) {
//         return(monitor.show(), systemUnit.turnOn());
//     }
// }

contract Number {
    uint private num = 4;
    function changeNum() public {
        num = 5;
    }
    function getNum() public view returns(uint) {
        return num;
    }
}

contract Caller {
    Number internal instance = new Number();
    function changeNumber() public {
        instance.changeNum();
    }
    function getNumber() public view returns(uint) {
        return instance.getNum();
    }
}