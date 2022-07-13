#!/bin/bash
cat ls/unl/chip.out | grep -Po '".*?"' | head -n1 > ls/unl/chip1.out

