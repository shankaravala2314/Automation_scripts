#!/bin/bash

# ==========================================
# CHANGE ONLY BELOW VALUES
# ==========================================

SOURCE="I:\\Part_2\\Data\\Kanpur\\test"

DESTINATION="sysgrid/store-igenesys/kanpur/test"

MC_PATH="/mnt/c/mc/mc.exe"

# ==========================================
# LOG FILE CONFIGURATION
# ==========================================

LOG_DIR="logs"

mkdir -p "$LOG_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

LOG_FILE="$LOG_DIR/upload_$TIMESTAMP.log"

# ==========================================
# START
# ==========================================

echo "==================================================" | tee -a "$LOG_FILE"
echo "UPLOAD STARTED" | tee -a "$LOG_FILE"
echo "==================================================" | tee -a "$LOG_FILE"

echo "Source      : $SOURCE" | tee -a "$LOG_FILE"
echo "Destination : $DESTINATION" | tee -a "$LOG_FILE"
echo "Log File    : $LOG_FILE" | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "Uploading..." | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

# ==========================================
# RUN COMMAND
# ==========================================

"$MC_PATH" mirror --overwrite --retry "$SOURCE" "$DESTINATION" 2>&1 | tee -a "$LOG_FILE"

# ==========================================
# STATUS
# ==========================================

if [ ${PIPESTATUS[0]} -eq 0 ]; then
    echo "" | tee -a "$LOG_FILE"
    echo "==================================================" | tee -a "$LOG_FILE"
    echo "UPLOAD COMPLETED SUCCESSFULLY" | tee -a "$LOG_FILE"
    echo "==================================================" | tee -a "$LOG_FILE"
else
    echo "" | tee -a "$LOG_FILE"
    echo "==================================================" | tee -a "$LOG_FILE"
    echo "UPLOAD FAILED" | tee -a "$LOG_FILE"
    echo "==================================================" | tee -a "$LOG_FILE"
fi

echo ""
echo "Logs saved at: $LOG_FILE"
