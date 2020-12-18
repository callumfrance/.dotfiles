#!/bin/bash

function git_is_in_local() {
    local branch=${1}
    local existed_in_local=$(git branch --list ${branch})

    if [[ -z ${existed_in_local} ]]; then
        # echo "git is not in local 1"
        return 1
    else
        # echo "git is in local 0"
        return 0 # 'true'
    fi
}

function git_is_in_remote() {
    local branch=${1}
    local existed_in_remote=$(git ls-remote --heads origin ${branch})

    if [[ -z ${existed_in_remote} ]]; then
        # echo "git is not in remote - 1"
        return 1
    else
        # echo "git is in remote 0"
        return 0 # 'true'
    fi
}

function git_check_me_out() {
    local branch=${1}
    if git_is_in_remote $branch; then 
        echo "git checkout $branch; git fetch && git pull";
        git checkout $branch -q; git fetch -q && git pull -q;
        return 0 # 'true'
    else
        return 1 # 'false'
    fi
}

function git_fresh() {
    local branch_name=${1:-master} # set branch name to parameter of defaults to 'master'
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        # echo "trying $branch_name branch";
        if git_check_me_out ${branch_name}; then
            # echo "$branch_name updated"
            return 0 # 'true'
        fi
        branch_name='main'
        # echo "trying $branch_name branch";
        if git_check_me_out ${branch_name}; then
            # echo "$branch_name updated"
            return 0 # 'true'
        fi
        echo "branch name was not found";
    else
        echo "no, is not a git repo";
    fi
}

git_fresh $1
