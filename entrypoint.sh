#!/bin/bash -x

printenv > /etc/environment

if [ -n "${CRONTAB_UPDATE}" ]
then
    if [ "${CRONTAB_UPDATE}" == "disabled" ]
    then
        sed -E -i "/index.php update/s,^,#," ${CRONTAB_FILE}
    else
        sed -E -i "/index.php update/{s,\* \* \* \* \*,$CRONTAB_UPDATE,g; }" ${CRONTAB_FILE}
    fi
fi

if [ -n "${CRONTAB_DISCOVER}" ]
then
    if [ "${CRONTAB_DISCOVER}" == "disabled" ]
    then
        sed -E -i "/index.php discover/s,^,#," ${CRONTAB_FILE}
    else
        sed -E -i "/index.php discover/{s,\* \* \* \* \*,$CRONTAB_DISCOVER,g; }" ${CRONTAB_FILE}
    fi
fi

crontab ${CRONTAB_FILE}

cron -f