#!/bin/bash

# Numero di lampeggiamenti
NUM_FLASHES=5

# Durata di ogni lampeggio (in secondi)
FLASH_DURATION=0.5

for i in $(seq 1 $NUM_FLASHES); do
    # Attiva il salvaschermo (schermo nero)
    gnome-screensaver-command -a
    sleep $FLASH_DURATION
    
    # Disattiva il salvaschermo
    gnome-screensaver-command -d
    sleep $FLASH_DURATION
done

echo "Lampeggiamento completato."

