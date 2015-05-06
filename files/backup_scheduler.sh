#!/bin/bash

mkdir -p $BACKUP_OUTPUT_FOLDER

while (true); do
	sleep $BACKUP_INTERVAL
	FILENAME=${BACKUP_PREFIX}_$(date +%Y-%m-%d_%H_%M).zip
	cd /opt/jasperserver/buildomatic
	./js-export.sh --output-zip $BACKUP_OUTPUT_FOLDER/$FILENAME --everything
	if [ "$SEND_BACKUP_TO_AWS" = true ]; then
        	aws s3 cp ${BACKUP_OUTPUT_FOLDER}/$FILENAME s3://$S3_BUCKET_NAME/$FILENAME
		if [ "$DELETE_AFTER_UPLOAD_TO_AWS" = true ]; then
			rm -rf ${BACKUP_OUTPUT_FOLDER}/$FILENAME
		fi
	fi
done
