#!/usr/bin/python3
# This script fetches an employee's TODO list progress from a REST API
# and exports the data to a CSV file.

import csv
import requests
import sys

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: {} <employee_id>".format(sys.argv[0]))
        sys.exit(1)

    employee_id = sys.argv[1]
    try:
        employee_id = int(employee_id)
    except ValueError:
        print("Employee ID must be an integer")
        sys.exit(1)

    base_url = "https://jsonplaceholder.typicode.com/"

    user_url = base_url + "users/{}".format(employee_id)
    user_response = requests.get(user_url)
    if user_response.status_code != 200:
        print("Error fetching user data")
        sys.exit(1)
    user_data = user_response.json()
    employee_username = user_data.get("username")

    todos_url = base_url + "todos?userId={}".format(employee_id)
    todos_response = requests.get(todos_url)
    if todos_response.status_code != 200:
        print("Error fetching TODO list data")
        sys.exit(1)
    todos_data = todos_response.json()

    file_name = "{}.csv".format(employee_id)
    with open(file_name, mode='w', newline='') as file:
        writer = csv.writer(file, quoting=csv.QUOTE_ALL)
        for task in todos_data:
            writer.writerow([
                employee_id,
                employee_username,
                task.get("completed"),
                task.get("title")
            ])
