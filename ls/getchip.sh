#!/bin/bash
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=12000 2>&1 ls/unl/chip.out
