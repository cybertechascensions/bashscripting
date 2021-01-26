#!/bin/bash

# This script demonstrates funstions

log() {
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = 'true' ]]; then
		echo "${MESSAGE}"
	fi
}

readonly VERBOSE='true'
log 'Hello!'
log 'This is fun!'

