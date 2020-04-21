#!/usr/bin/env nix-shell
#!nix-shell -p cachix -i bash

cachix push silence $OUT_PATHS
