#!/bin/bash
kill -9 `ps aux | grep qemu-system | grep -v grep | awk '{print $2}'`
