import json

with open('storage/data.json') as f:
    data = json.load(f)
    print(data)