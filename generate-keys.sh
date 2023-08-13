#!/usr/bin/env sh

if [ "$MNEMONIC" = "" ]; then
  MNEMONIC=$(eth2-val-tools mnemonic)

  echo "Mnemonic: $MNEMONIC"
fi

eth2-val-tools deposit-data \
  --source-min $START_INDEX \
  --source-max $END_INDEX \
  --validators-mnemonic "$MNEMONIC" \
  --withdrawals-mnemonic "$MNEMONIC" \
  --as-json-list \
  --fork-version 0x00000000 | \
  jq ".[] | \"0x\" + .pubkey + \":\" + .withdrawal_credentials" | tr -d '"'
