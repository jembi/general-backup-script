General backup script
=====================

A general backup script that can be installed as a cron job to backup applications

Suggested conventions:

* Each backup runs nightly at midnight
* Each backup script is installed as a cron job
* Each backup script cleans up after itself, it keeps the backups for the past 30 days and the backup from the first of very month (see sample script)
* Each backup contains both contain any persistent application storage and any config files needed
* Each backup filename conforms to the format shown in the sample script, ie. <app_name>-backup-yyyy-mm-dd
