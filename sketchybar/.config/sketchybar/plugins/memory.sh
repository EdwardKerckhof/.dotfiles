#!/bin/bash

# Get memory stats from vm_stat
MEMORY_INFO=$(vm_stat | grep -E "Pages (free|active|inactive|speculative|wired down|occupied by compressor)")

# Convert page counts to numbers, considering page size is 4096 bytes (4KB)
PAGES_FREE=$(echo "$MEMORY_INFO" | grep "Pages free" | awk '{print $3}' | sed 's/\.//')
PAGES_ACTIVE=$(echo "$MEMORY_INFO" | grep "Pages active" | awk '{print $3}' | sed 's/\.//')
PAGES_INACTIVE=$(echo "$MEMORY_INFO" | grep "Pages inactive" | awk '{print $3}' | sed 's/\.//')
PAGES_SPECULATIVE=$(echo "$MEMORY_INFO" | grep "Pages speculative" | awk '{print $3}' | sed 's/\.//')
PAGES_WIRED=$(echo "$MEMORY_INFO" | grep "Pages wired down" | awk '{print $4}' | sed 's/\.//')
PAGES_COMPRESSED=$(echo "$MEMORY_INFO" | grep "Pages occupied by compressor" | awk '{print $5}' | sed 's/\.//')

# Calculate used and total memory
USED_MEM=$((PAGES_ACTIVE + PAGES_WIRED + PAGES_COMPRESSED))
TOTAL_MEM=$((PAGES_FREE + PAGES_ACTIVE + PAGES_INACTIVE + PAGES_SPECULATIVE + PAGES_WIRED + PAGES_COMPRESSED))

# Calculate percentage
MEM_PERCENT=$(echo "scale=0; ($USED_MEM * 100) / $TOTAL_MEM" | bc)

sketchybar --set "$NAME" label="${MEM_PERCENT}%"
