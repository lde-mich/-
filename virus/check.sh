#!/bin/bash

# Nome dello script da controllare
script_name="misbus.sh"

# Loop infinito
while true; do
  # Controlla se lo script è attivo
  if ! pgrep -x "$script_name" > /dev/null; then
    echo "PENSAVI FOSSE COSI FACILE, LO RIAVVIO..."
    # Avvia lo script in background
    sh $script_name &
  fi
  # Attendi prima di controllare di nuovo
  sleep 10
done

