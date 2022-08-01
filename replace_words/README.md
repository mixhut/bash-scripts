                    _                                                       _               _     
 _ __   ___  _ __  | |  __ _   ___   ___        __      __  ___   _ __   __| | ___     ___ | |__  
| '__| / _ \| '_ \ | | / _` | / __| / _ \       \ \ /\ / / / _ \ | '__| / _` |/ __|   / __|| '_ \ 
| |   |  __/| |_) || || (_| || (__ |  __/        \ V  V / | (_) || |   | (_| |\__ \ _ \__ \| | | |
|_|    \___|| .__/ |_| \__,_| \___| \___| _____   \_/\_/   \___/ |_|    \__,_||___/(_)|___/|_| |_|
            |_|                          |_____|                  
---
# GitHub | @mixhut | v1.2 ============================================================================
---

### Description:
        Find & replace patterns inplace in files.

#### Changes:
- Added no cli args error message
- Removed unnecessary variables
- Added line dedupe 

#### To-Do:    
- Add line to loop that prints changes to file for manual error review.


#### Usage: 

```$  ./replace_words.sh  changewords.txt  targetfile.txt```

changewords.txt :   Contains the changes you'd like to make.
                    Formatted comma separated like so:

                        chagnetihs,change this
                        emergancy,emergency
                        spleling,spelling
                        spcae , space 
                        2020,2022
                        2021,2022