#!/bin/bash

# Nama container MySQL (ubah jika perlu)
DB_CONTAINER=$(docker ps --filter "ancestor=mysql:8.0" --format "{{.Names}}" | head -n 1)
BACKUP_FILE="db_backup_$(date +%Y%m%d_%H%M%S).sql"

if [ -z "$DB_CONTAINER" ]; then
  echo "❌ Container database tidak ditemukan."
  exit 1
fi

echo "💾 Membackup database dari container: $DB_CONTAINER"
docker exec $DB_CONTAINER mysqldump -u root -prootpassword wordpress > backup_db/$BACKUP_FILE

echo "✅ Backup selesai: $BACKUP_FILE"
