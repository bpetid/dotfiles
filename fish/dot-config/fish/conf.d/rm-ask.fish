function rm --wraps rm
    echo "rm is dangerous. Are you sure you want to permanently remove $argv? Type the same command to confirm..."
    read -l -S confirmation

    # Check the exit status of the read command
    if test $status -ne 0
        echo "" # Add a newline after the prompt on cancellation
        echo "Removal cancelled."
        return # Exit the function
    end

    if test "$confirmation" = "$argv" -o "$confirmation" = "rm $argv"
        echo "Removing $argv"
        command rm $argv
    else
        echo "Removal cancelled."
    end
end
