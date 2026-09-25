#!/bin/bash

RISH_BIN="${RISH_BIN:-rish}"

run_rish() {
    "$RISH_BIN" -c "$1"
}
