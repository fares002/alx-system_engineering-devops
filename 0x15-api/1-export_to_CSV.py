#!/usr/bin/python3
"""
Return:
Records all tasks that are owned by this employee
Format must be: "USER_ID","USERNAME","TASK_COMPLETED_STATUS","TASK_TITLE
"""
import requests
import sys

if __name__ == "__main__":
    employee_id = sys.argv[1]
    file_name = employee_id + ".csv"
    url = 'https://jsonplaceholder.typicode.com/'
    toDo_response = requests.get(url+f"users/{employee_id}/todos").json()
    employee = requests.get(url+f"/users/{employee_id}").json()
    employee_name = employee.get("name")

    with open(file_name, "w") as file:
        for todo in toDo_response:
            task_completed = todo.get("completed")
            task_title = todo.get("title")
            line = f'"{employee_id}","{employee_name}",'
            line2 = f'{line}"{task_completed}","{task_title}"\n' 
            file.write(line2)
