#!/bin/bash

if [[ -n "$SSH_CLIENT" ]]; then
    CLIENT_IP="${SSH_CLIENT%% *}"
    echo "$CLIENT_IP"
fi