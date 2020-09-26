#!/bin/bash

# Paths
SPICETIFY="$HOME/spicetify-cli"
CARGO="$HOME/.cargo/bin"
LOCAL_BIN="$HOME/.local/bin/"

PATH="$PATH:$SPICETIFY:$CARGO:$LOCAL_BIN"
export PATH
