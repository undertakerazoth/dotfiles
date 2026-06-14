#!/bin/bash

COUNT=$(makoctl list 2>/dev/null | wc -l)

echo " $COUNT"