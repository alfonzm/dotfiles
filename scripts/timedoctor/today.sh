#!/bin/bash

# TODO: If CACHE_FILE does not exist, create it with value '{ "daily": 0, "weekly": 0 }'

source ~/.zshenv

# To retrieve a token: https://timedoctor.redoc.ly/#operation/authorizationLogin
TOKEN="$TIMEDOCTOR_API_TOKEN"

# Set API parameters
# FROM="2023-05-03T00%3A00%3A00.00"
# TO="2023-05-04T00%3A00%3A00.00"
FROM=$(date "+%Y-%m-%dT00:00:00.00") # today 12am
TO=$(date -v+1d "+%Y-%m-%dT00:00:00.00") # tomorrow 12am
USER="YvWMUfeiy3MO-IAh"
COMPANY="Xpji3q6XzgAEmojE"
SORT="date"
PERIOD="days"
TIMEZONE="Asia%2FManila"
CACHE_FILE="/tmp/today.sh.txt"
CACHE_DURATION_MIN=2

CURRENT_DATE=$(date "+%Y-%m-%dT%H:%M:%S")
WEEK_START=$(date -j -v-Sun -v0H -v0M -v0S -f "%Y-%m-%dT%H:%M:%S" "$CURRENT_DATE" "+%Y-%m-%dT%H:%M:%S")
WEEK_END=$(date -j -v+1w -v-Sun -v0H -v0M -v0S -f "%Y-%m-%dT%H:%M:%S" "$CURRENT_DATE" "+%Y-%m-%dT%H:%M:%S")

if [[ -z "$TOKEN" ]]; then
    echo "No TIMEDOCTOR_API_TOKEN found"
    exit 1
fi

# Check if cached total exists and is less than CACHE_DURATION_MIN old
if [[ -f "$CACHE_FILE" ]] && [[ "$(find "$CACHE_FILE" -mmin "-$CACHE_DURATION_MIN")" ]]; then
    CACHE_JSON=$(cat "$CACHE_FILE")
    TOTAL_SECS_DAY=$(echo "$CACHE_JSON" | jq -r '.daily')
    TOTAL_SECS_WEEK=$(echo "$CACHE_JSON" | jq -r '.weekly')
else
    # Daily
    # Make API request and extract total seconds
    DAILY_JSON=$(curl -sX GET "https://api2.timedoctor.com/api/1.1/stats/total?token=$TOKEN&from=$FROM&to=$TO&user=$USER&company=$COMPANY&sort=$SORT&period=$PERIOD&timezone=$TIMEZONE" -H "Content-Type: application/json")

    # check if response property "error" is equal to "invalidToken"
    ERROR=$(echo "$DAILY_JSON" | jq -r '.error')
    if [[ "$ERROR" == "invalidToken" ]]; then
        echo "Invalid Timedoctor API token"
        exit 1
    fi

    # Get the daily total or default to 0
    TOTAL_SECS_DAY=$(echo "$DAILY_JSON" | jq -r '.data[0].total // "0"')

    # Weekly
    # Make API request and extract total seconds
    WEEKLY_JSON=$(curl -sX GET "https://api2.timedoctor.com/api/1.1/stats/total?token=$TOKEN&from=$WEEK_START&to=$WEEK_END&user=$USER&company=$COMPANY&sort=$SORT&period=$PERIOD&timezone=$TIMEZONE" -H "Content-Type: application/json")
    # Get the daily total or default to 0
    TOTAL_SECS_WEEK=$(echo "$WEEKLY_JSON" | jq -r '.data[0].total // "0"')

    # Save total to cache file
    echo "{\"daily\": $TOTAL_SECS_DAY, \"weekly\": $TOTAL_SECS_WEEK}" > "$CACHE_FILE"
fi

# Convert total seconds to hours and minutes
HOURS=$((TOTAL_SECS_DAY / 3600))
MINUTES=$((TOTAL_SECS_DAY % 3600 / 60))

# Calculate the end time in seconds since the epoch
END_TIME_EPOCH=$(date -v+6H -v-${TOTAL_SECS_DAY}S +"%s")

# Get the current time in seconds since the epoch
CURRENT_TIME_EPOCH=$(date +"%s")

# Calculate the time difference
TIME_DIFF=$((CURRENT_TIME_EPOCH - END_TIME_EPOCH))

# Check if the current time is greater than END_TIME_EPOCH
if [[ $TIME_DIFF -gt 0 ]]; then
    # Calculate time in hours and minutes
    TIME_HOURS=$((TIME_DIFF / 3600))
    TIME_MINUTES=$((TIME_DIFF % 3600 / 60))

    # Display the time difference as "Xh Ym ago" format
    TIME_AGO="${TIME_HOURS}h ${TIME_MINUTES}m ago"
else
    # Display the original formatted end time
    TIME_AGO=$(date -r "$END_TIME_EPOCH" +"%-l:%M %p")
fi

# Format the duration
DURATION="${HOURS}h ${MINUTES}m"

# Format the end time
END_TIME_FORMATTED=$(date -r "$END_TIME_EPOCH" +"%-l:%M %p")

REQUIRED_WEEK_SECS=$((3600 * 6 * 5)) # 6hrs * 5days
WEEK_SECS_LEFT=$((REQUIRED_WEEK_SECS - TOTAL_SECS_WEEK))
WEEK_LEFT_HOURS=$((WEEK_SECS_LEFT / 3600))
WEEK_LEFT_MINUTES=$((WEEK_SECS_LEFT % 3600 / 60))
WEEK_LEFT="${WEEK_LEFT_HOURS}h ${WEEK_LEFT_MINUTES}m"

# Print result
echo "$DURATION ($TIME_AGO) • $WEEK_LEFT"
