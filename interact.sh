 #!/usr/bin/expect
set GOODIES [lindex $argv 1]
set  keyname  [lindex $argv 0]
eval spawn ssh-add -K  ~/.ssh/$keyname
expect "Enter passphrase for /Users/joeexotic/.ssh/github-omhm"
send "$GOODIES\r"
interact