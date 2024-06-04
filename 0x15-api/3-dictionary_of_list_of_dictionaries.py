#!/usr/bin/python3
import json
import requests
import sys


def fetch_all_tasks():
    users_url = "https://jsonplaceholder.typicode.com/users"
    todos_url = "https://jsonplaceholder.typicode.com/todos"

    try:
        users_response = requests.get(users_url)
        users_response.raise_for_status()
        todos_response = requests.get(todos_url)
        todos_response.raise_for_status()
    except requests.RequestException as e:
        print(f"Error fetching data: {e}")
        sys.exit(1)

    users = users_response.json()
    todos = todos_response.json()

    all_tasks = {}

    for user in users:
        user_id = user.get("id")
        username = user.get("username")
        user_tasks = []
        for task in todos:
            if task.get("userId") == user_id:
                task_info = {
                    "username": username,
                    "task": task.get("title"),
                    "completed": task.get("completed")
                }
                user_tasks.append(task_info)
        all_tasks[user_id] = user_tasks

    return all_tasks


if __name__ == "__main__":
    all_tasks = fetch_all_tasks()
    with open("todo_all_employees.json", "w") as json_file:
        json.dump(all_tasks, json_file)
