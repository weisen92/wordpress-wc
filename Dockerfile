FROM wordpress:latest

# Salin folder wp-content lokal ke image
COPY wp-content /var/www/html/wp-content

# (Opsional) install unzip & curl jika ingin menambahkan plugin secara otomatis
# RUN apt-get update && apt-get install -y unzip curl && rm -rf /var/lib/apt/lists/*

# (Opsional) tambahkan konfigurasi PHP custom jika perlu
# COPY custom-php.ini /usr/local/etc/php/conf.d/
