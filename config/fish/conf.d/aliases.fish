# Easier navigation
abbr --add .. cd ..
abbr --add ... cd ../..
abbr --add .... cd ../../..
abbr --add ..... cd ../../../..

# Enable aliases to be sudo'ed
alias sudo 'sudo '

# Get week number
abbr --add week date +%V

# Clean up LaunchServices to remove duplicates in the "Open With" menu
abbr --add lscleanup /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user '&&' killall Finder

# View HTTP traffic
abbr --add sniff sudo ngrep -d en0 -t "'^(GET|POST) '" "'tcp and port 80'"
abbr --add httpdump sudo tcpdump -i en1 -n -s 0 -w - '|' grep -a -o -E "\"Host\\: .*|GET \\/.*\""

# Canonical hex dump; some systems have this symlinked
if not command --query hd
    abbr --add hd hexdump -C
end

# macOS has no md5sum, so use md5 as a fallback
if not command --query md5sum
    abbr --add md5sum md5
end

# macOS has no sha1sum, so use shasum as a fallback
if not command --query sha1sum
    abbr --add sha1sum shasum
end

# bundle exec
abbr --add be bundle exec

# kubectl
abbr --add k kubectl
