#!/bin/bash
cat saved/chip.out | grep -Po '".*?"' | head -n1 > saved/chip1.out

