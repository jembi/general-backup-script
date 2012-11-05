#!/bin/bash

app_name=
backup_dir=/home/$(logname)/backups
backup_filename=$app_name-backup-`date +%Y-%m-%d`
backup_filename_tar=$backup_filename".tar.gz"

# Print status
echo "Backing up $appname..."

cd $backup_dir

# Backup all the things - config files and databases
#---------------------------------------------------

# Add things to backup here...

# Backup a mysql database
db_user=""
db_password=""
db_name=""
backup_filename_sql=$backup_filename".sql"
mysqldump -u $db_user -p$db_password $db_name > $backup_dir/$backup_filename_sql

# Backup a file
cp /path/to/file.txt $backup_dir

# Archive all the things
#-----------------------

tar czf $backup_dir/$backup_filename_tar $backup_filename_sql file.txt

# Cleanup
#--------

# Clean up file that aren't needed here...

rm $backup_dir/$backup_filename_sql
rm $backup_dir/file.txt

# Finalise
----------

# Print status
echo "Done backing up $app_name."

# Display created backup file
echo "Created backup file: " $backup_filename_tar " in " $backup_dir

# Copy to off site server
$remote_user=""
$remote_pass=""
$remote_host=""
$remote_dir=""
scp $backup_dir/$backup_filename_tar $remote_user@$remote_host:$remote_dir
echo "Copied backup file to remote server: " $backup_filename_tar

# Cleanup old backup files
#  - keep previous 30 days backups and the backup from the first of every month
find $backup_dir -name "$app_name-backup-*" -mtime +30 -not -name "$app_name-backup*-01.tar.gz" -exec rm {} \;


