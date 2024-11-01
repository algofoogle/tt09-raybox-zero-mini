#!/bin/bash

TTPYTHON=python3.11
TTPROMPT=tt09
TTTOOLS=/home/anton/ttsetup@tt09
mkdir -p "$TTTOOLS/pdk"

# From https://github.com/TinyTapeout/tt-gds-action/blob/ac4c7934481e7c5fb9afa202a72a14025e78e13f/action.yml#L53-L57
FLOW=openlane2
FLOW_ARG=--openlane2
OPENLANE2_TAG=2.1.9
PDK_ROOT=$TTTOOLS/pdk
PDK=sky130A

# Mangling of https://github.com/TinyTapeout/tt-gds-action/blob/ac4c7934481e7c5fb9afa202a72a14025e78e13f/action.yml#L122
LINTER_LOG_BASE="runs/wokwi/*-verilator-lint/verilator-lint.log"

VENV_DIR="$TTTOOLS/venv"
VENV_CMD="$VENV_DIR/bin/activate"
if [ ! -e "$VENV_CMD" ]; then
    echo "NOTE: Venv $VENV_CMD doesn't exist; creating it..."
    $TTPYTHON -m venv --prompt "$TTPROMPT" "$VENV_DIR"
    echo "DONE."
fi
echo "Activating VENV..."
source "$VENV_CMD"
echo "NOTE: If prompt doesn't include '($TTPROMPT)' then make sure you do: source $0"

