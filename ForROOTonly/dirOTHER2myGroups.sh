#!/bin/bash

# UPDATED SCRIPT - Corrected source base directory

source_base_dir="/home/rooty"  # <----- UPDATED: Changed to /home/rooty - assuming folders are there
source_folders=("TXT" "Books" "HomeworksOLD" "ScriptsSTUD")
user_ranges=("stud1036-stud1041" "stud1109-stud1112" "stud1018" "stud-id")

for folder in "${source_folders[@]}"; do
  source_dir="${source_base_dir}/${folder}"

  if [ ! -d "${source_dir}" ]; then
    echo "Warning: Source folder ${source_dir} does not exist. Skipping."
    continue
  fi

  echo "Processing folder: ${folder}"

  for range in "${user_ranges[@]}"; do
    start_user=$(echo "$range" | cut -d'-' -f1)
    end_user=$(echo "$range" | cut -d'-' -f2)

    if [[ "$range" == *"-"* ]]; then # Range of users
      start_num=$(echo "$start_user" | grep -oE '[0-9]+')
      end_num=$(echo "$end_user" | grep -oE '[0-9]+')
      prefix=$(echo "$start_user" | grep -oE '[a-zA-Z]+')

      for ((i=$start_num; i<=$end_num; i++)); do
        username="${prefix}${i}"
        destination_dir="/home/${username}/${folder}"

        echo "  Copying ${folder} to user: ${username}"

        # Remove destination directory if it exists (overwrite)
        sudo rm -rf "${destination_dir}"

        # Copy directory content recursively
        sudo cp -R "${source_dir}" "${destination_dir}"

        if [ $? -eq 0 ]; then
          echo "    Content copied to ${destination_dir}"

          # Change ownership to the user
          sudo chown -R "${username}:${username}" "${destination_dir}"
          echo "    Ownership set to ${username}:${username}"

          # Set permissions: Sticky bit on directory, 0755 for dirs, 0644 for files inside
          sudo chmod 1755 "${destination_dir}"
          sudo find "${destination_dir}" -type d -exec chmod 0755 {} \;
          sudo find "${destination_dir}" -type f -exec chmod 0644 {} \;
          echo "    Permissions set (1755 on dir, 0755 on subdirs, 0644 on files)"

        else
          echo "    Error copying to ${destination_dir}"
        fi
      done
    else # Single user (not a range)
      username="${range}"
      destination_dir="/home/${username}/${folder}"

      echo "  Copying ${folder} to user: ${username}"

      # Remove destination directory if it exists (overwrite)
      sudo rm -rf "${destination_dir}"

      # Copy directory content recursively
      sudo cp -R "${source_dir}" "${destination_dir}"

      if [ $? -eq 0 ]; then
        echo "    Content copied to ${destination_dir}"

        # Change ownership to the user
        sudo chown -R "${username}:${username}" "${destination_dir}"
        echo "    Ownership set to ${username}:${username}"

        # Set permissions: Sticky bit on directory, 0755 for dirs, 0644 for files inside
        sudo chmod 1755 "${destination_dir}"
        sudo find "${destination_dir}" -type d -exec chmod 0755 {} \;
        sudo find "${destination_dir}" -type f -exec chmod 0644 {} \;
        echo "    Permissions set (1755 on dir, 0755 on subdirs, 0644 on files)"
      else
        echo "    Error copying to ${destination_dir}"
      fi
    fi
  done
  echo "Finished processing folder: ${folder}"
  echo "-------------------------"
done

echo "All folders processed for all users."
