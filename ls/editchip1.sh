#!/bin/bash
cat ls/unl/chip.out | grep -Po '".*?"' | head -n1 2>&1 ls/unl/chip1.out

