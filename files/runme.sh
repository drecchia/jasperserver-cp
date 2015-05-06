#!/bin/bash
/backup_scheduler.sh &

cat /opt/jasperserver/apache-tomcat/webapps/jasperserver/WEB-INF/js.quartz.properties.template > /opt/jasperserver/apache-tomcat/webapps/jasperserver/WEB-INF/js.quartz.properties
echo "report.scheduler.mail.sender.host=$report_scheduler_mail_sender_host" >> /opt/jasperserver/apache-tomcat/webapps/jasperserver/WEB-INF/js.quartz.properties 
echo "report.scheduler.mail.sender.username=$report_scheduler_mail_sender_username" >> /opt/jasperserver/apache-tomcat/webapps/jasperserver/WEB-INF/js.quartz.properties
echo "report.scheduler.mail.sender.password=$report_scheduler_mail_sender_password" >> /opt/jasperserver/apache-tomcat/webapps/jasperserver/WEB-INF/js.quartz.properties
echo "report.scheduler.mail.sender.from=$report_scheduler_mail_sender_from" >> /opt/jasperserver/apache-tomcat/webapps/jasperserver/WEB-INF/js.quartz.properties
echo "report.scheduler.mail.sender.protocol=$report_scheduler_mail_sender_protocol" >> /opt/jasperserver/apache-tomcat/webapps/jasperserver/WEB-INF/js.quartz.properties
echo "report.scheduler.mail.sender.port=$report_scheduler_mail_sender_port" >> /opt/jasperserver/apache-tomcat/webapps/jasperserver/WEB-INF/js.quartz.properties
echo "report.scheduler.web.deployment.uri=$report_scheduler_web_deployment_uri" >> /opt/jasperserver/apache-tomcat/webapps/jasperserver/WEB-INF/js.quartz.properties

/opt/jasperserver/ctlscript.sh start
tail -f /opt/jasperserver/apache-tomcat/logs/catalina.out 
