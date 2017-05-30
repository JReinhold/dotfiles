#!/usr/bin/env fish

# Create a new directory and enter it
function mkd -d "Create a directory and cd into it"
    command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end
funcsave mkd

# `o` with no arguments opens the current directory, otherwise opens the given location
function o -d "Opens current dir or 1st argument in Finder, creates it if it doesn't exist"
	if [ (count $argv) -eq 0 ]
		open .
	else
		open "$argv"
		if test $status != 0
			echo "it has now been created"
			mkd $argv
		end
	end
end
funcsave o

# 'gi' function to use gitignore.io API
printf "function gi\n\tcurl -L -s https://www.gitignore.io/api/\$argv\nend\n" > ~/.config/fish/functions/gi.fish
