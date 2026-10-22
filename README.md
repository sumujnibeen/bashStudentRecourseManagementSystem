# Student Record Management System

### Bash-Based Student Record Management System

![Bash](https://img.shields.io/badge/Bash-Scripting-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Environment-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![CLI](https://img.shields.io/badge/Interface-CLI-blue?style=for-the-badge)
![Academic Project](https://img.shields.io/badge/Project-Academic-purple?style=for-the-badge)

A simple command-line application developed using Bash scripting to manage student records, track attendance, update marks, calculate grades, and generate basic academic statistics.

## Project Demo




https://github.com/user-attachments/assets/8109dd2f-adf8-416b-8808-86977ee1c67f






PASTE_GITHUB_VIDEO_ATTACHMENT_URL_HERE

## Features

- **Add Student:** Add student ID, name, department, and semester.
- **View Student:** View an individual student's record using their ID.
- **Search Student:** Search student records by name.
- **Update Attendance:** Update student attendance percentages.
- **Update Marks:** Update marks and automatically calculate grades.
- **Show All Students:** Display all stored student records.
- **Count Students:** Count the total number of student records.
- **Delete Student:** Delete a student record using their ID.
- **Statistics:** Calculate average attendance, average marks, highest marks, and lowest marks.

## Grade Calculation

| Marks | Grade |
|---|---|
| 80–100 | A+ |
| 70–79 | A |
| 60–69 | A- |
| 50–59 | B |
| 40–49 | C |
| 33–39 | D |
| 0–32 | F |

## Technologies Used

- **Language:** Bash
- **Environment:** Linux / Bash-compatible shell
- **Storage:** Text files
- **Interface:** Command-Line Interface (CLI)

## Getting Started

### Prerequisites

- Linux or a Bash-compatible environment
- Bash shell
- Standard command-line utilities such as `grep`, `sed`, `cut`, and `wc`

### Installation and Execution

1. Clone the repository:

   ```bash
   git clone <repository-url>
   ```

2. Navigate to the project directory:

   ```bash
   cd <project-directory>
   ```

3. Create the student records directory:

   ```bash
   mkdir -p students
   ```

4. Run the script:

   ```bash
   bash main.sh
   ```

Replace `main.sh` with the actual Bash script filename if necessary.

## Data Storage

Each student's information is stored in an individual text file named after their student ID.

Example record:

```text
ID: 101
Name: Example Student
Department: CSE
Semester: 3.1
Attendance: 85
Marks: 78
Grade: A
```

The system uses a simple file-based approach and does not require a database.

## Learning Outcomes

- Bash functions and modular scripting
- Conditional statements, loops, and `case` statements
- File handling and basic input validation
- Text processing using `grep`, `sed`, and `cut`
- Arithmetic operations and summary statistics

## Limitations

This is a basic academic project intended for command-line use. It does not include a graphical user interface or database integration, and its input validation and error handling are limited.

## Academic Context

Developed as part of CSE 3.1 (3rd Year, 1st Semester) academic coursework.
