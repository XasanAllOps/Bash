# Changelog

All notable changes to this script will be documented in this file 🙌🏽

## [1.0.0]
### Initial

- Created a script that prompts the user to enter a directory and a keyword, then searches for that keyword across all `.log` files in the specified directory.
- The script outputs the names of the log files that contain the keyword.
- Includes input validation to ensure the directory and keyword fields are not left empty, and checks that the specified directory exists.
- Used color-coded messages to improve user feedback and overall readability.
- While the original challenge was based on using predefined paths and values, I chose to make the script more dynamic by accepting user input at runtime.
- Also added clear inline comments explaining the use of `grep -l` to list matching files — similar to how I annotated file handling in Level 7 using `ls`, `sort`, and `awk` — to make the script more understandable and maintainable.



