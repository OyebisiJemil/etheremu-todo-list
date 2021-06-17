pragma solidity >=0.4.16 <0.9.0;

contract TodoList {
    //keep track of the number of todo list inside a state variable
    uint256 public taskCount = 0;
    //to store the tasks, we need a state variable (like database)
    mapping(uint256 => Task) public tasks;

    struct Task {
        uint256 id;
        string content;
        bool completed;
    }

    event TaskCreated(uint id, string content, bool completed);
    event TaskCompleted(uint id, bool completed);
    //to initialize a default task to the todolist when the contract run for the first time
    constructor() public {
        createTask("This is the deafult task");
    }

    //to store the struct inside the mapping state variable
    function createTask(string memory _content) public {
        taskCount++; //to increment the above state variable by one
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
       Task memory _task = tasks[_id];
       _task.completed = !_task.completed;
       tasks[_id] = _task;
       emit TaskCompleted(_id, _task.completed);
    }
}
