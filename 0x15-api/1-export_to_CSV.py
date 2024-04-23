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
    employee_response = requests.get(url+f"{employee_id}").json()
    toDo_response = requests.get(url+f"users/{employee_id}/todos").json()
    employee = requests.get(url+f"/users/{employee_id}").json()
    employee_name = employee.get("name")

    with open(file_name, "w") as file:
        for todo in toDo_response:
            file.write(f'"{employee_id},"{employee_name}",\
                    "{todo.get("completed")}","{todo.get("title")}"\n')
