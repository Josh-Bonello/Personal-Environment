
#NIC Hosts
alias ci-dev='ssh ets-vvaprd-cimaster-a01'
alias oem='ssh ets-vvaprd-oradb-a02'
alias veridata='ssh nic-vtxprd-oradb01'
alias grafana='ssh 172.31.110.35'
alias va-exa='ssh va-exadb01'
alias tx-exa='ssh tx-exadb01'
alias va-t4='ssh oracle@vadc-prd-soldb01a'
alias tx-t4='ssh oracle@txdc-prd-soldb01a'

#Set HOSTNAME and SSH_KEY first
export HOSTNAME=''
export SSH_KEY=''
alias passwordless_login="cat ${SSH_KEY} | ssh ${HOSTNAME} 'cat >> .ssh/authorized_keys'"
