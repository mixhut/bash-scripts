                                                     _  _                            _     
 _ __   ___  _ __ ___    ___  __   __  ___        | |(_) _ __    ___  ___     ___ | |__  
| '__| / _ \| '_ ` _ \  / _ \ \ \ / / / _ \       | || || '_ \  / _ \/ __|   / __|| '_ \ 
| |   |  __/| | | | | || (_) | \ V / |  __/       | || || | | ||  __/\__ \ _ \__ \| | | |
|_|    \___||_| |_| |_| \___/   \_/   \___| _____ |_||_||_| |_| \___||___/(_)|___/|_| |_|
                                           |_____|                                       
---
GitHub | @mixhut | v1.2 ============================================================================
---
 
**Description**:
Takes input from file which has keywords, including regex patterns to remove, applies it to file and saves changes.
 
**Changes**:
Created generate_terms.sh - generates a stopwords.txt file< from premade sets in the /patterns folder.
Added case insensitive matching
Appended date to filenames processed for clarity

**To-Do:**
Output pattern in memory, prepend to lines in the .deleted file to see which string is causing deletion (regex debugging).
 

**Usage:**
$ ./generate_terms.sh   # Generates a stopwords file
$ ./remove_lines.sh stopwords.txt your_target_file.txt

