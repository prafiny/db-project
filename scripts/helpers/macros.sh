#!/bin/bash

check_term() {
if [ ! -t 0 ]; then
	xterm -hold -e "bash $0"
fi
}
