# 📄 Change Log

All notable changes to this script will be documented in this file 🙌🏽

## [1.0.0]
### Initial

- Developed a Bash script that monitors a directory using `fswatch`.
- Detects and logs the following file events:
  - ✅ File **creation/modification** — logged as `[MODIFIED/CREATED]`
  - ✅ File **deletion** — logged as `[DELETED]`
- Logs are saved to `monitor_log.txt` with timestamped entries.
- Outputs changes in colored format:
  - 🟢 Green for modified/created
  - 🔴 Red for deleted
  - 🟡 Yellow and 🔵 Bright cyan for user prompts and status messages
- Uses UK local time (Europe/London) for timestamps.
- Filters out unwanted noise such as:
  - Vim temp files (`.swp`, `.swx`, `*~`, `4913`)
  - Hidden files (`.*`)
- Graceful exit messages for empty or invalid directory inputs.

---