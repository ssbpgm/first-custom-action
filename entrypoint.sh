#!/bin/bash
set -e

# look for the GH environment variable $GITHUB_EVENT_PATH to tell if the script is running in the workflow environment (launched by an actual event) or locally (when we're testing the action)
if [ -n "$GITHUB_EVENT_PATH" ];
then
    EVENT_PATH=$GITHUB_EVENT_PATH
elif [ -f ./sample_push_event.json ];
then
    EVENT_PATH='./sample_push_event.json'

    # flag telling the script is running locally
    LOCAL_TEST=true
else
    echo "No JSON data to process! :("
    exit 1
fi

# print environment variables set by the OS
env

# print the contents of the action payload
jq . < $EVENT_PATH

# using jq to extract the contents of the payload to determine if the KEYWORD argument is found in the commits or head commits messages
if jq '.commits[].message, .head_commit.message' < $EVENT_PATH | grep -i -q "$*";
then
    # do something
    echo "Found keyword."
# otherwise
else
    # exit gracefully
    echo "Nothing to process."
fi
