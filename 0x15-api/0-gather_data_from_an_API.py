#!/usr/bin/python3
"""a given employee ID,
returns information about his/her
TODO list progress."""
import sys
import requests


if __name__ == "__main__":
    url = 'https://jsonplaceholder.typicode.com/'
    employee_id = sys.argv[1]
    employee_response = requests.get(url+f"{employee_id}").json()
    employee_name = requests.get(url+f"/users/{employee_id}").json()
    toDo_response = requests.get(url+f"users/{employee_id}/todos")
    toDo_list = toDo_response.json()
    completed_task = []
    for todo in toDo_list:
        if todo.get("completed") is True:
            completed_task.append(todo.get("title"))
    len1 = len(completed_task)
    len2 = len(toDo_list)
    employee_result = employee_name.get("name")
    print(f"Employee {employee_result} is done with tasks({len1}/{len2}):")
    for i in completed_task:
        print(f"\t {i}")
