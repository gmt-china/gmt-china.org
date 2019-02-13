import toml
import json

gmt_users = {
    "type": "FeatureCollection",
    'features': [],
}
id = 0
for item in toml.load("user-map.toml")['user']:
    user = {
        'id': id,
        'type': 'Feature',
        'geometry': {
            'type': 'Point',
            'coordinates': item['coordinates']
        },
        'properties': {
            'name': item['name'],
            'city': item['city']
        }
    }
    id += 1
    gmt_users['features'].append(user)

with open('user-map.json', 'w') as outfile:
    json.dump(gmt_users, outfile, ensure_ascii=False)
