tell application "iTerm"
    set shell_path to "/path/to/your/script.sh"
    activate
    try
        set currentWindow to current window
        set isNewWindow to false
    on error
        set currentWindow to (create window with default profile)
        set isNewWindow to true
    end try
    tell currentWindow
        if not isNewWindow then
            create tab with default profile
        end if
        tell the current session to write text "sh " & shell_path
        tell the current session to write text "exit"
    end tell
end tell
