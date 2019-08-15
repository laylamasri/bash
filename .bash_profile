ssh-add -K ~/.ssh/id_rsa > /dev/null 2>&1

alias seavpn="/usr/local/bin/sshuttle --daemon --remote lmasri@login.3tier.com 172.20.0.0/16 172.21.0.0/16 172.22.0.0/16 172.31.0.0/16 216.243.27.0/24"
alias killvpn="kill \$(ps aux | grep sshuttle | grep laylamasri | grep -v logger | grep -v grep | awk '{print \$2}')"
alias killcisco="kill \$(ps aux | grep Cisco | grep laylamasri | grep -v logger | grep -v grep | awk '{print \$2}')"
alias h3="ssh lmasri@hydra3"
alias h3r="ssh lmasri@hydra3.3tier.com"
alias cw="mysql --local-infile=1 -h cyclops-write -u lmasri -p"
alias cwr="mysql --local-infile=1 -h cyclops-write.3tier.com -u lmasri -p"
alias cr="mysql --local-infile=1 -h cyclops-read -u lmasri -p"
alias crr="mysql --local-infile=1 -h cyclops-read.3tier.com -u lmasri -p"
alias ingest="sftp -P 222 lmasri@clover.3tier.com"
alias carch="mysql --local-infile=1 -h cyclops-archive -u lmasri -p"
alias carchr="mysql --local-infile=1 -h cyclops-archive.3tier.com -u lmasri -p"
alias getchecker='scp lmasri@hydra3.3tier.com:/home/dataops/src/QC/html/dataStatus.html ~/Desktop'
alias athena="mysql -h athena -u ops -p"
alias ctest="mysql --skip-secure-auth -h cyclops-test -u ops -p"
alias ctestr="mysql --skip-secure-auth -h cyclops-test.3tier.com -u ops -p"
alias lmysql="/usr/local/opt/mysql@5.6/bin/mysql -h localhost -u laylamasri -p"
alias ntdev="ssh ops@neptune-dev10"
alias ntdevr="ssh ops@neptune-dev10.3tier.com"
alias nt="ssh ops@neptune"
alias ntr="ssh ops@neptune.3tier.com"
alias lsql="mysql -u root"
alias gorgon="ssh lmasri@master.gorgon.3tier.com"
alias orochi="ssh lmasri@master.orochi.3tier.com"
alias clover='sftp -P 222 lmasri@clover.3tier.com'
alias matlab="ssh lmasri@matlab1.dev.3tier.com"
alias vpn2="/usr/local/bin/sshuttle --daemon --remote lmasri@login.3tier.com 172.20.0.0/16 172.21.0.0/16 172.22.0.0/16 172.31.0.0/16 216.243.27.0/24 172.24.0.0/24"
alias weather='curl http://wttr.in/Seattle'
alias moon='curl http://wttr.in/moon'

alias bpadumpr="mysqldump -h cyclops-read -u ops -p --skip-secure-auth --skip-add-drop-table bpa metplus > metplus.sql"
alias bpadumpa="mysqldump -h cyclops-archive -u lmasri -p --skip-add-drop-table bpa metplus > metplus_archive.sql"
alias bpaarchive="mysql -h cyclops-archive -u lmasri -p bpa < metplus.sql"

alias rwisdumpa="mysqldump -h cyclops-archive -u lmasri -p --skip-add-drop-table rwis obs_2019 > obs_2019_archive.sql"
alias rwisdumpr="mysqldump -h cyclops-read -u ops -p --skip-secure-auth --skip-add-drop-table --where='year(date_time)=2019' rwis obs > obs.sql"
alias rwisloadl="mysql -u root rwis < obs.sql"
alias rwisdumpl="mysqldump -u root rwis --skip-add-drop-table obs_2019 > obs_2019.sql"
alias rwisloada="mysql -h cyclops-archive -u lmasri -p rwis < obs_2019.sql"

alias caisoarch="printf 'caisodumpa\ncaisodumpr\ncaisoloadl\ncaisodatel\ncaisodatea\ncaisodropl\ncaisodumpl\nmore sub_hourly_2019.sql\ncaisodropa\ncaisoloada\n'"

alias caisodumpa="mysqldump -h cyclops-archive -u lmasri -p --skip-add-drop-table caiso  sub_hourly_2019 >  sub_hourly_2019_archive.sql"
alias caisodumpr="mysqldump -h cyclops-read -u ops -p --skip-secure-auth --where='year(date_time)=2019' --skip-add-drop-table caiso  sub_hourly > sub_hourly.sql"
alias caisoloadl="mysql -u root caiso < sub_hourly.sql"
alias caisodumpl="mysqldump -u root --skip-add-drop-table caiso sub_hourly_2019 > sub_hourly_2019.sql"
alias caisoloada="mysql -h cyclops-archive -u lmasri -p caiso < sub_hourly_2019.sql"
alias caisodatel="lsql -e 'use caiso; select min(date_time), max(date_time), count(*) from sub_hourly;'"
alias caisodatea="carch -e 'use caiso; select min(date_time), max(date_time), count(*) from sub_hourly_2019;'"
alias caisodropl="lsql -e 'use caiso; drop table sub_hourly_2019; rename table sub_hourly to sub_hourly_2019;'"
alias caisodropa="carch -e 'drop table caiso.sub_hourly_2019;'"

caisodatecompare () {
date=${1}
lsql -e "use caiso; select min(date_time), max(date_time), count(*) from sub_hourly where date_time<='$date';"
}

alias ercotarch="printf 'ercotdumpa\nercotdumpr\nercotloadl\nercotdatel\nercotdatea\nercotdropl\nercotdumpl\nmore actuals_summary_2019.sql\nercotdropa\nercotloada\n'"

alias ercotdumpa="mysqldump -h cyclops-archive -u lmasri -p --skip-add-drop-table ercot actuals_summary_2019 > actuals_summary_2019_archive.sql"
alias ercotdumpr="mysqldump -h cyclops-read -u ops -p --skip-secure-auth --skip-add-drop-table --where='year(date_time)=2019' ercot actuals_summary > actuals_summary.sql"
alias ercotloadl="mysql -u root ercot < actuals_summary.sql"
alias ercotdumpl="mysqldump -u root ercot --skip-add-drop-table actuals_summary_2019 > actuals_summary_2019.sql"
alias ercotloada="mysql -h cyclops-archive -u lmasri -p ercot < actuals_summary_2019.sql"
alias ercotdatel="lsql -e 'use ercot; select min(date_time), max(date_time), count(*) from actuals_summary;'"
alias ercotdatea="carch -e 'use ercot; select min(date_time), max(date_time), count(*) from actuals_summary_2019;'"
alias ercotdropl="lsql -e 'use ercot; drop table ercot.actuals_summary_2019; rename table ercot.actuals_summary to ercot.actuals_summary_2019;'"
alias ercotdropa="carch -e 'drop table ercot.actuals_summary_2019;'"

ercotdatecompare () {
date=${1}
lsql -e "use ercot; select min(date_time), max(date_time), count(*) from actuals_summary where date_time<='$date';"
}

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PATH="/usr/local/mysql/bin:$PATH"

export HISTTIMEFORMAT="%d-%m-%y %T "
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=1000000
shopt -s histappend

export GREP_OPTIONS='--color=always' 

alias asm="ssh layla@10.0.0.127"

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
