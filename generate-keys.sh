#!/usr/bin/env sh

mnemonic=$(eth2-val-tools mnemonic)

echo "Mnemonic: $mnemonic"
eth2-val-tools pubkeys \
  --validators-mnemonic="$mnemonic" \
  --source-min=$START_INDEX \
  --source-max=$END_INDEX
