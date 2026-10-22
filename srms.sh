 #!/bin/bash



addStudent() {

    echo
    echo " Add Student "

    read -p "Enter Student ID: " id
  

    if [ -f students/$id.txt ]
    then
        echo "Student already exists!"
        return
    fi



    read -p "Enter Name: " name
    read -p "Enter Department: " dept
    read -p "Enter Semester: " semester


    touch students/$id.txt

    echo "ID: $id" > students/$id.txt
    echo "Name: $name" >> students/$id.txt
    echo "Department: $dept" >> students/$id.txt
    echo "Semester: $semester" >> students/$id.txt
    echo "Attendance: 0" >> students/$id.txt
    echo "Marks: 0" >> students/$id.txt
    echo "Grade: N/A" >> students/$id.txt

    echo
    echo "Student Added Successfully!"
}







viewStudent() {

    echo
    echo " View Student "

    read -p "Enter Student ID: " id

    if [ ! -f students/$id.txt ]
    then
        echo "Student Not Found!"
        return
    fi

    echo
    cat students/$id.txt

}






searchStudent() {

    clear
    echo " Search Student "
    echo

    read -p "Enter Student Name: " name

    found=0

    for file in students/*.txt
    do
        if grep -iq "Name: $name" "$file"
        then
            echo
            echo "Student Found!"
            echo 
            cat "$file"
            echo 
            echo

            found=1
        fi
    done

    if [ $found -eq 0 ]
    then
        echo
        echo "Student Not Found!"
    fi

    echo
    read -p "Press Enter to Continue..."
}







updateAttendance() {


    clear
    echo " Update Attendance "
    echo

    read -p "Enter Student ID: " id

    if [ ! -f students/$id.txt ]
    then
        echo "Student Not Found!"
        return
    fi

    read -p "Enter New Attendance (%): " attendance


    if [ "$attendance" -lt 0 ] || [ "$attendance" -gt 100 ]
    then
    	echo "Invalid Attendance!"
    	return
    fi


    sed -i "s/^Attendance:.*/Attendance: $attendance/" students/$id.txt

    echo
    echo "Attendance Updated Successfully!"

    echo
    cat students/$id.txt

    echo
    read -p "Press Enter to Continue..."
}








updateMarks() {

    clear
    echo "Update Marks "
    echo

    read -p "Enter Student ID: " id

    if [ ! -f students/$id.txt ]
    then
        echo "Student Not Found!"
        return
    fi

    read -p "Enter New Marks: " marks

    if [ $marks -lt 0 ] || [ $marks -gt 100 ]
    then
    	echo "Invalid Marks!"
    	return
    fi

    if [ $marks -ge 80 ]
    then
        grade="A+"
    elif [ $marks -ge 70 ]
    then
        grade="A"
    elif [ $marks -ge 60 ]
    then
        grade="A-"
    elif [ $marks -ge 50 ]
    then
        grade="B"
    elif [ $marks -ge 40 ]
    then
        grade="C"
    elif [ $marks -ge 33 ]
    then
        grade="D"
    else
        grade="F"
    fi

    
    sed -i "s/^Marks:.*/Marks: $marks/" students/$id.txt

    
    sed -i "s/^Grade:.*/Grade: $grade/" students/$id.txt

    echo
    echo "Marks Updated Successfully!"
    echo

    cat students/$id.txt

    echo
    read -p "Press Enter to Continue..."
}




showAllStudents() {

    clear
    echo " All Students "
    echo

    if [ -z "$(ls students/*.txt 2>/dev/null)" ]
    then
        echo "No Student Records Found!"
        echo
        read -p "Press Enter to Continue..."
        return
    fi

    for file in students/*.txt
    do
        echo 
        cat "$file"
        echo 
        echo
    done

    read -p "Press Enter to Continue..."
}



countStudents() {

    clear
    echo "Count Students"
    echo

    total=$(ls students/*.txt 2>/dev/null | wc -l)

    echo "Total Students: $total"

    echo
    read -p "Press Enter to Continue..."
}



deleteStudent() {

    clear
    echo "Delete Student "
    echo

    read -p "Enter Student ID: " id

    if [ ! -f students/$id.txt ]
    then
        echo
        echo "Student Not Found!"
        echo
        read -p "Press Enter to Continue..."
        return
    fi

    rm students/$id.txt

    echo
    echo "Student Deleted Successfully!"

    echo
    read -p "Press Enter to Continue..."
}


statistics() {

    clear
    echo "Statistics "
    echo

    total=0
    totalAttendance=0
    totalMarks=0
    highest=0
    lowest=100

    for file in students/*.txt
    do
        attendance=$(grep "Attendance:" "$file" | cut -d' ' -f2)
        marks=$(grep "Marks:" "$file" | cut -d' ' -f2)

        total=$((total + 1))
        totalAttendance=$((totalAttendance + attendance))
        totalMarks=$((totalMarks + marks))

        if [ $marks -gt $highest ]
        then
            highest=$marks
        fi

        if [ $marks -lt $lowest ]
        then
            lowest=$marks
        fi
    done

    if [ $total -eq 0 ]
    then
        echo "No Student Records Found!"
        read -p "Press Enter to Continue..."
        return
    fi

    averageAttendance=$((totalAttendance / total))
    averageMarks=$((totalMarks / total))

    echo "Total Students      : $total"
    echo "Average Attendance : $averageAttendance%"
    echo "Average Marks      : $averageMarks"
    echo "Highest Marks      : $highest"
    echo "Lowest Marks       : $lowest"

    echo
    read -p "Press Enter to Continue..."
}










while true
do
    clear

    echo 
    echo "   STUDENT RECORD MANAGEMENT SYSTEM"
    echo
    echo
    echo "1. Add Student"
    echo "2. View Student"
    echo "3. Search Student"
    echo "4. Update Attendance"
    echo "5. Update Marks"
    echo "6. Show All Students"
    echo "7. Count Students"
    echo "8. Delete Student"
    echo "9. Statistics"
    echo "10. Exit"
    echo

    read -p "Enter your choice: " choice

    case $choice in

        1)
            addStudent
            ;;

        2)
            viewStudent
            ;;

        3)
            searchStudent
            ;;

        4)
            updateAttendance
            ;;

        5)
            updateMarks
            ;;

        6)
            showAllStudents
            ;;

        7)
            countStudents
            ;;

        8)
            deleteStudent
            ;;

        9)
            statistics
            ;;

        10)
            echo "Thank You."
            break
            ;;

        *)
            echo "Invalid Choice"
            ;;
    esac

    echo
    read -p "Press Enter to Continue..."
done
