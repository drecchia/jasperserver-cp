# Jasperserver Community
Docker image for a standalone Jasper Server Community with embedded postgres, ready to run.
Support for backup job over aws s3.

Variables
---------

Interval since auto backups via js-export script

    ENV BACKUP_INTERVAL 10d
  
Folder to save backup

    ENV BACKUP_OUTPUT_FORLDER /backup
  
File prefix

    ENV BACKUP_PREFIX jasperbackup

If backup should be sent do AWS

    ENV SEND_BACKUP_TO_AWS false
  
If file should be deleted after upload

    ENV DELETE_AFTER_UPLOAD_TO_AWS true

Auto explicative

    ENV S3_BUCKET_NAME docker-jasper-backups.example.com
    ENV AWS_ACCESS_KEY_ID **DefineMe**
    ENV AWS_SECRET_ACCESS_KEY **DefineMe**
    ENV AWS_DEFAULT_REGION us-east-1

Report job configuration

    ENV report_scheduler_mail_sender_host mail.localhost.com
    ENV report_scheduler_mail_sender_username admin
    ENV report_scheduler_mail_sender_password password
    ENV report_scheduler_mail_sender_from admin@localhost.com
    ENV report_scheduler_mail_sender_protocol smtp
    ENV report_scheduler_mail_sender_port 25
    ENV report_scheduler_web_deployment_uri http://localhost:8080/jasperserver

Running Example
---------------

    docker run -d -e BACKUP_INTERVAL=1d -e SEND_BACKUP_TO_AWS=false -v /backup-jasper:/backup drecchia/jasperserver-cp:6.0.1


