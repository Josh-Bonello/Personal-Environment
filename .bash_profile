alias setenv='ps -ef|grep pmon|sort -k9;. oraenv;pwd'
alias oh='cd $ORACLE_HOME;pwd'
alias tns='cd $ORACLE_HOME/network/admin;pwd'
alias pmon='ps -eaf|grep pmon'
alias admin='cd "${ORACLE_BASE:-/u01/app/oracle}/admin"'
alias dbs='cd $ORACLE_HOME/dbs;ls'
#uncomment the one that is right your you
alias oratab='cat /etc/oratab'
#alias oratab='cat /var/opt/oracle/oratab'
alias oracle='sudo su - oracle'
set -o vi

#PS1='[\u@\h:\w] $ '
export PS1=['\[\e[31m\u\]@\[\e[36m\h\]\[\e[0m\]:[\e[32m\w\]\[\e[33m\]\[\e[0m\]]\[\e[1m\]$ \[\e[0m\]'

# I apologize for plagerism,  but this was way good!
# Quick and dirty function to cd into the alertlog / trace directory for the
# current ORACLE_SID. For RAC databases, it's assumed that ORACLE_SID follows
# the usual pattern of matching DB name plus a single digit.
log() {
   local dir
   local inst_type

   if [ -z "$ORACLE_SID" ]; then
      echo "ORACLE_SID must have a value" >&2
      return 1
   fi

   if [ "${ORACLE_SID:0:1}" != "+" ]; then
      inst_type=rdbms
   else
      inst_type=asm
   fi

   # check the non-RAC scenario first
   dir="${ORACLE_BASE:-/u01/app/oracle}/diag/${inst_type}/`echo ${ORACLE_SID} | tr '[:upper:]' '[:lower:]'`/${ORACLE_SID}/trace"
   if [ -d "$dir" ]; then
      cd "$dir";pwd;ls -ltr *log
      return 0
   fi

   # now the RAC scenario
   dir="${ORACLE_BASE:-/u01/app/oracle}/diag/${inst_type}/`echo ${ORACLE_SID:0:${#ORACLE_SID}-1} | tr '[:upper:]' '[:lower:]'`/${ORACLE_SID}/trace"
   if [ -d "$dir" ]; then
      cd "$dir";pwd;ls -ltr *log
      return 0
   fi

   echo "Trace directory for \"${ORACLE_SID}\" not found" >&2
   return 1
}

