#!/bin/bash
cd ~/BiosUnlocking/gui/ 2>/dev/null
rm ls/unl/* dp/unl/* ch/unl/* 2>/dev/null
gnome-terminal -- python main.py
