#!/bin/bash

date +"%m/%d/%y %H:%M:%S" >> /opt/snapshot/logs/ps.log
ps auxf >> /opt/snapshot/logs/ps.log

