#!/bin/bash
echo 'Sending Redmine Emails!!!'

cd ${HOME}/redmine3.1-stable
#RAILS_ENV=production bundle exec rake redmine:send_reminders days=7
RAILS_ENV=production bundle exec rake redmine:send_reminders
