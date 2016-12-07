#!/usr/bin/env expect

#send "/bin/bash git_fetch.sh\r"

#set timeout 20

spawn ssh carius -l deploy
expect "password:"
send "deploy\r"

expect "~$\r"
send "rm -rfv repos/* && mkdir -p repos\r"

expect "~$\r"
send "exit\r"
interact

spawn sftp -prC deploy@carius
expect "password:"
send "deploy\r"

expect "sftp>"
send "put -r repos/\r"
send "bye\r"
interact

spawn ssh carius -l deploy
expect "password:"
send "deploy\r"

expect "~$\r"
send "cd /home/deploy/rails/redmine && export RAILS_ENV=production && rake -f Rakefile redmine:fetch_changesets && rake -f Rakefile redmine:send_reminders\r"

expect "~$\r"
send "exit\r"
interact

# ssh pericuma -l deploy 'rm -rfv repos/*; mkdir -p repos'

# sftp -prC deploy@pericuma <<EOF
# put -r repos/
# bye
# EOF

#ssh pericuma -l deploy 'cd /home/deploy/rails/redmine && export RAILS_ENV=production && rake -f Rakefile redmine:fetch_changesets && rake -f Rakefile redmine:send_reminders'



# ssh parnamirim -l deploy 'rm -rfv repos/*; mkdir -p repos'

# sftp -prCP 22 deploy@parnamirim <<EOF
# put -r repos/
# bye
# EOF

#ssh parnamirim -l deploy 'cd /home/deploy/rails/redmine && export RAILS_ENV=production && rake -f Rakefile redmine:fetch_changesets && rake -f Rakefile redmine:send_reminders'