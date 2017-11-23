#!/bin/bash

check_term() {
if [ "$NO_TERM" != "true" ]; then
	if [ ! -t 0 ]; then
		xterm -hold -e "bash $0"
	fi
fi
}
