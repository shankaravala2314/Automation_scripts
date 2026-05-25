import os
import subprocess
from datetime import datetime

# ==========================================
# CHANGE ONLY BELOW VALUES
# ==========================================

SOURCE = r"I:\Part_2\Data\Kanpur\test"
DESTINATION = "sysgrid/store-igenesys/kanpur/test"

MC_PATH = r"C:\mc\mc.exe"

# ==========================================
# LOG FILE
# ==========================================

log_folder = "logs"
os.makedirs(log_folder, exist_ok=True)

timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
log_file = os.path.join(log_folder, f"upload_{timestamp}.log")

# ==========================================
# COMMAND
# ==========================================

command = [
    MC_PATH,
    "mirror",
    "--overwrite",
    "--retry",
    SOURCE,
    DESTINATION
]

# ==========================================
# START
# ==========================================

print("=" * 50)
print("UPLOAD STARTED")
print("=" * 50)

print(f"Source      : {SOURCE}")
print(f"Destination : {DESTINATION}")
print(f"Log File    : {log_file}")

print("\nUploading...\n")

# ==========================================
# RUN COMMAND
# ==========================================

with open(log_file, "w") as log:
    process = subprocess.Popen(
        command,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True
    )

    for line in process.stdout:
        print(line, end="")
        log.write(line)

    process.wait()

# ==========================================
# STATUS
# ==========================================

if process.returncode == 0:
    print("\n" + "=" * 50)
    print("UPLOAD COMPLETED SUCCESSFULLY")
    print("=" * 50)
else:
    print("\n" + "=" * 50)
    print("UPLOAD FAILED")
    print("=" * 50)

input("\nPress Enter to exit...")