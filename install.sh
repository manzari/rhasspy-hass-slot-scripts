#!/bin/bash
source slots/.env
touch slots/ignore.lsv
cp -RT slots "$SLOTS_DIR"
cp -RT sentences "$SENTENCES_DIR"
echo "Done."
echo "Please restart Hass to load changed automations and retrain rhasspy to add new sentences and execute the slots"