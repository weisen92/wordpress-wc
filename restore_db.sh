#!/bin/bash

DB_CONTAINER=$(docker ps --filter "ancestor=mysql:8.0" --format "{{.Names}}" | head -n 1)
RESTORE_FILE="backup_db/$1"   # Atau ubah ke file lain
echo " $RESTORE_FILE "

if [ ! -f "$RESTORE_FILE" ]; then
  echo "❌ File $RESTORE_FILE tidak ditemukan di direktori saat ini."
  exit 1
fi

if [ -z "$DB_CONTAINER" ]; then
  echo "❌ Container database tidak ditemukan."
  exit 1
fi

echo "📤 Menyalin $RESTORE_FILE ke container..."
docker cp $RESTORE_FILE $DB_CONTAINER:/tmp/db_restore.sql

echo "♻️ Melakukan restore ke database..."
docker exec -i $DB_CONTAINER sh -c 'mysql -u root -prootpassword wordpress < /tmp/db_restore.sql'

echo "✅ Restore database selesai."
