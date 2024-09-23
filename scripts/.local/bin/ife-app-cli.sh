#!/usr/bin/env bash

# Check if the required arguments are provided
if [ $# -lt 2 ]; then
    echo 'Usage: $0 <jira id> <clear description, inside brackets (")>'
    exit 1
fi

# Extract arguments
number=$1
shift
description=$(echo "$*" | tr ' ' '-')

# Create branch name
branch_name="prodsqd-${number}-${description}"

# Create new branch from master
git checkout master
git pull
git checkout -b "$branch_name"

# Create a commit to link the branch to the Jira ticket
git commit --allow-empty -m "PRODSQD-${number} Branch creation"

# Push the new branch to remote
git push -u origin "$branch_name"

# Create merge request using glab CLI
glab mr create \
    --title "$*" \
    --description "Jira ticket: https://immfly.atlassian.net/browse/PRODSQD-$number" \
    --assignee "alex.dickson" \
    --source-branch "$branch_name" \
    --target-branch master \
    --squash-before-merge \
    --remove-source-branch \
    --yes

echo "Merge request created successfully!"
