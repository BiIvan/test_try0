#!/bin/bash

function real_dir() {
  pushd "$1" >/dev/null
  pwd -P
  popd >/dev/null
}
SCRIPT_FOLDER=$(real_dir "$(dirname "$0")")

BASE_DIR=${SCRIPT_FOLDER}/../../../..
SOLUTION_FOLDER=${BASE_DIR}

bash "${SCRIPT_FOLDER}/build.sh" || exit 1

source "${BASE_DIR}/.venv/bin/activate"

export CONFIG_PATH="${SOLUTION_FOLDER}/data/config.json"
export IMAGE_NAME=join_game

pytest \
  --junitxml="${BASE_DIR}/join_game.xml" \
  "${BASE_DIR}/test_try0/tests/test_s02_join_game.py"