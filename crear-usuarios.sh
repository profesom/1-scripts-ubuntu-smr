#!/bin/bash

# Create users with home directories and set passwords
sudo adduser --home /home/alumnosmrd --gecos "" --disabled-password alumnosmrd
echo "alumnosmrd:Estudia+2425" | sudo chpasswd

sudo adduser --home /home/alumnosmrv --gecos "" --disabled-password alumnosmrv
echo "alumnosmrv:Trabaja+2425" | sudo chpasswd

# Add users to the 'sudo' group to share applications with the admin user
sudo usermod -aG sudo alumnosmrd
sudo usermod -aG sudo alumnosmrv

# Set permissions to allow shared access to admin's applications
sudo setfacl -m u:alumnosmrd:rwx /home/admin
sudo setfacl -m u:alumnosmrv:rwx /home/admin

# Define directories to create
directories=("Descargas" "Downloads" "Imágenes" "Images" "Trash" "Recientes" "Documentos" "Documents" "Music" "Música" "Escritorio" "Desktop")

# Function to create directories and add sample file
create_sample_files() {
    user=$1
    user_home="/home/$user"

    for dir in "${directories[@]}"; do
        dir_path="$user_home/$dir"
        sudo mkdir -p "$dir_path"
        echo "sample file of text" | sudo tee "$dir_path/sample.txt" > /dev/null
        sudo chown -R "$user:$user" "$dir_path"
    done
}

# Create directories and sample files for each user
create_sample_files "alumnosmrd"
create_sample_files "alumnosmrv"

echo "Users created, directories prepared, and sample files added successfully!"
