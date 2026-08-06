# timestamp
tms() {
    echo -n "[ $(date +%Y%m%d_%H%M%S) ] "
}

# Usage:
(tms; echo "Starting $0") >> ${gr_LOGF}
(tms; echo -n "1 - Starting backups ... ") | tee -a ${gr_LOGF}
