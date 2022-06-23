#!/usr/bin/env bash
source .env
curl -XGET -s \
  -H "Authorization: Bearer $AUTH_TOKEN" \
  -H "Content-type: application/json" \
  "$HASS_URL/api/states" \
    | jq '.[] | {entity_id, "name" : .attributes["friendly_name"]} | select(.entity_id | contains("scene."))' \
    | jq -r '. | (.name)+":{scene_entity:"+(.entity_id)+"}"' \
    | grep -v -x -f ignore.lsv
exit 0
