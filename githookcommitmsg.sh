#!/usr/bin/env bash

# set this to your active development branch
develop_branch="master"
current_branch="$(git rev-parse --abbrev-ref HEAD)"

# only check commit messages on main development branch
[ "$current_branch" != "$master_branch" ] && exit 0

# regex to validate in commit msg
commit_regex='(T-\d+:\s*\w*)'

error_msg="Aborting commit. Your commit message a Azure Devops Issue ('T-1111')"

if ! grep -iqE "$commit_regex" "$1"; then
    echo "$error_msg" >&2
    exit 1
fi
