#!/bin/bash
cat fu/unl/chip.out | grep -Po '".*?"' | head -n1 > fu/unl/chip1.out

