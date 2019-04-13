#!/bin/sh -x

printenv > /etc/environment

[ -n "$CRONTAB_UPDATE" ] && sed -E -i "/index.php update/{s,\* \* \* \* \*,$CRONTAB_UPDATE,g; }" $CRONTAB_FILE
[ -n "$CRONTAB_DISCOVER" ] && sed -E -i "/index.php discover/{ s,\* \* \* \* \*,$CRONTAB_DISCOVER,g; }" $CRONTAB_FILE

crontab ${CRONTAB_FILE}

cron -f