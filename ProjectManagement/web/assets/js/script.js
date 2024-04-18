document.addEventListener("DOMContentLoaded", function() {
  const addTaskBtns = document.querySelectorAll(".add-task-btn");

  addTaskBtns.forEach(function(btn) {
    btn.addEventListener("click", function() {
      const column = btn.closest(".column");
      const taskList = column.querySelector(".task-list");

      const input = document.createElement("input");
      input.type = "text";
      input.classList.add("task-input");
      input.placeholder = "Enter task...";
      input.addEventListener("keyup", function(event) {
        if (event.key === "Enter" && input.value.trim() !== "") {
          const task = document.createElement("div");
          task.classList.add("task");
          task.textContent = input.value.trim();
          taskList.appendChild(task);
          input.value = "";
        }
      });
      taskList.appendChild(input);
      input.focus();
    });
  });

  $(".task-list").sortable({
    connectWith: ".task-list",
    placeholder: "task-placeholder",
    receive: function(event, ui) {
      const sourceColumn = ui.sender.closest(".column");
      const targetColumn = ui.item.closest(".column");

      if (targetColumn.id === "todo-column" && sourceColumn.id === "backlog-column") {
        // Task moved from Backlog to To-do
        return;
      } else if (targetColumn.id === "inprogress-column" && sourceColumn.id === "todo-column") {
        // Task moved from To-do to In Progress
        return;
      } else if (targetColumn.id === "done-column" && sourceColumn.id === "inprogress-column") {
        // Task moved from In Progress to Done
        return;
      } else {
        // Move back to original column
        $(this).sortable('cancel');
      }
    }
  }).disableSelection();
});

$(document).ready(function() {
  $(".task-list").sortable({
    connectWith: ".task-list",
    placeholder: "task-placeholder",
    receive: function(event, ui) {
      ui.item.css("top", 0).css("left", 0);
    }
  }).disableSelection();
});