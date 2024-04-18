CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(255) UNIQUE NOT NULL,
    password NVARCHAR(255) NOT NULL
);
CREATE TABLE Employees(
	employee_id INT PRIMARY KEY IDENTITY(1,1),
	employee_code CHAR(10) NOT NULL,
	employee_name NVARCHAR(255) NOT NULL,
);
CREATE TABLE Projects (
    project_id INT PRIMARY KEY IDENTITY(1,1),
	project_code CHAR(10) NOT NULL,
    project_name VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE,
	status VARCHAR(50),
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
CREATE TABLE Tasks (
    task_id INT PRIMARY KEY IDENTITY(1,1),
	task_code CHAR(10) NOT NULL,
    project_id INT NOT NULL,
    task_name VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE,
	status VARCHAR(50),
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);
CREATE TABLE Risks(
	risk_id INT PRIMARY KEY IDENTITY(1,1),
	risk_code CHAR(10) NOT NULL,
	risk_name NVARCHAR(255) NOT NULL,
	Description NVARCHAR(255),
	Solution NVARCHAR(255),
	project_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

INSERT INTO Users (username, password)
VALUES ('admin@gmail.com', '12345678'),
       ('vuthuong@gmail.com', '12345678');

INSERT INTO Employees (employee_code, employee_name)
VALUES ('EMP01', 'John'),
       ('EMP02', 'Jane'),
       ('EMP03', 'Mary'),
	   ('EMP04', 'Michael');

INSERT INTO Projects (project_code, project_name, start_date, end_date, status, employee_id)
VALUES ('P01', 'Project 01', '2024-01-24', '2024-05-24', N'In Progress', 1),
       ('P02', 'Project 02', '2023-12-01', '2024-03-01', N'Not Started', 2),
       ('P03', 'Project 03', '2023-11-02', '2024-02-22', N'Completed', 3),
	   ('P04', 'Project 04', '2024-02-21', '2024-08-22', N'To-Do', 4);

INSERT INTO Tasks (task_code, project_id, task_name, start_date, end_date, status, employee_id)
VALUES ('T01', 1, 'Task 1 for Project 1', '2024-01-10', '2024-02-10', 'Completed', 1),
       ('T02', 1, 'Task 2 for Project 1', '2024-02-15', '2024-03-15', 'To-Do', 2),
       ('T03', 2, 'Task 1 for Project 2', '2024-02-20', '2024-03-20', 'In Progress', 3),
       ('T04', 2, 'Task 2 for Project 2', '2024-03-01', '2024-04-01', 'In Progress', 1),
       ('T05', 3, 'Task 1 for Project 3', '2024-03-20', '2024-04-20', 'To-Do', 2),
	   ('T06', 3, 'Task 2 for Project 3', '2024-03-20', '2024-04-20', 'Not Started', 3),
	   ('T07', 4, 'Task 1 for Project 4', '2024-03-20', '2024-04-20', 'Not Started',4),
	   ('T08', 4, 'Task 2 for Project 4', '2024-03-20', '2024-04-20', 'Completed', 4);
INSERT INTO Risks (risk_code, risk_name, Description, Solution, project_id)
VALUES ('R01', 'Risk 01', 'Risk of Project 1', 'Solution of Project 1', 1),
       ('R02', 'Risk 02', 'Risk of Project 2', 'Solution of Project 2', 2),
       ('R03', 'Risk 03', 'Risk of Project 3', 'Solution of Project 3', 3),
	   ('R04', 'Risk 04', 'Risk of Project 4', 'Solution of Project 4', 4);

