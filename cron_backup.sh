#!/bin/bash

# Set variables
DB_NAME="laravel"
BACKUP_DIR="/var/www/html/backup/database-backups/"
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")

# Dump database
mysqldump -u root $DB_NAME > $BACKUP_DIR/$DB_NAME-$TIMESTAMP.sql

# Add to Git and commit
cd $BACKUP_DIR
git add .
git commit -m "Automatic backup - $TIMESTAMP"
git push origin main
