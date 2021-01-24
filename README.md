# Installation and usage

go to your VPS
```
git clone git@github.com:zhisme/stackoverflow_fanatic_badge.git
cd stackoverflow_fanatic_badge/
bin/install
vim credentials.yml # enter yours, rollbar can be omitted
```
add info to your crontab, see crontab.conf for details
```
crontab -e
```
own VPS for 100 days to get a badge
profit!

## Development

For easier debugging you can switch to `:selenium_chrome` option in capybara setup.
see `lib/fanatic_badge.rb:7`

```
bin/run # single run
```
