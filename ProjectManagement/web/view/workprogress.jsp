<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Jira-like Task Manager</title>
        <script src="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/js/adminlte.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">
        <link rel="stylesheet" href="../assets/css/styles.css">
    </head>
    <div class="board">
        <div class="column backlog">
            <div class="column-header">
                <span>Backlog</span>
                <button class="add-task-btn">Add Task</button>
            </div>
            <div class="task-list">
                <!-- Tasks will be dynamically added here -->
            </div>
        </div>
        <div class="column todo">
            <div class="column-header">
                <span>To-do</span>
            </div>
            <div class="task-list">
                <!-- Tasks will be dynamically added here -->
            </div>
        </div>
        <div class="column in-progress">
            <div class="column-header">
                <span>In Progress</span>
            </div>
            <div class="task-list">
                <!-- Tasks will be dynamically added here -->
            </div>
        </div>
        <div class="column done">
            <div class="column-header">
                <span>Done</span>
            </div>
            <div class="task-list">
                <!-- Tasks will be dynamically added here -->
            </div>
        </div>
    </div>

    <div class="overlay">
        <div class="modal">
            <span class="close-btn">&times;</span>
            <input type="text" id="taskInput" placeholder="Enter task...">
            <button id="submitTask">Add Task</button>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
    <script src="../assets/js/script.js"></script>
</html>
