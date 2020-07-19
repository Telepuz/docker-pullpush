#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob globstar

# Variables
GIT_SSH_KEY="$SSH_KEY"
GIT_URL="$URL"
TIMEOUT="$TIMEOUT"
REPO_DIR="/repo"

# Main function
main () {
    eval "$(ssh-agent -s)"
    echo -e "$GIT_SSH_KEY" | ssh-add -

    # Check if repo exist
    if [[ ! -d $REPO_DIR/.git ]]; then
        git clone "$GIT_URL" "$REPO_DIR"
    fi

    cd "$REPO_DIR"
    while true; do
        git fetch --all
        git push
        sleep "$TIMEOUT"
    done
}
main "$@"