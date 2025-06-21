#!/usr/bin/env bash

# Function to prompt for input
prompt_input() {
    local prompt_message="$1"
    local input_variable="$2"
    read -p "$prompt_message: " $input_variable
}

# Prompt for inputs
prompt_input "Enter the Jira ID (e.g., 793)" jira_ticket_id
prompt_input "Enter the airline IATA code (e.g., IBE) or ALL" airline_iata_code
prompt_input "Enter the merge request title (without the IATA prefix, just white-space separated words)" mr_title

# Create lowercase version of mr_title for branch name
mr_title_lowercase=$(echo "$mr_title" | tr '[:upper:]' '[:lower:]')

# Create branch name (lowercase)
branch_name="ifec-${jira_ticket_id}-$(echo "$mr_title_lowercase" | tr ' ' '-')"

# Create new branch from master
git checkout master
git pull
git checkout -b "$branch_name"

# Create a commit to link the branch to the Jira ticket
git commit --allow-empty -m "IFEC-${jira_ticket_id} Branch creation"

# Push the new branch to remote
git push -u origin "$branch_name"

# Construct the full MR title with the airline code and Jira ID (preserving original case)
full_mr_title="[${airline_iata_code}-${jira_ticket_id}] $mr_title"

# Create merge request using glab CLI
glab mr create \
    --title "$full_mr_title" \
    --description "Jira ticket: https://immfly.atlassian.net/browse/IFEC-$jira_ticket_id" \
    --assignee "alex.dickson" \
    --source-branch "$branch_name" \
    --target-branch master \
    --squash-before-merge \
    --remove-source-branch \
    --yes

echo "Merge request created successfully!"
