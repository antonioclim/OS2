#!/bin/bash

user_ranges=("stud1036-stud1041" "stud1109-stud1112" "stud1018" "stud-id")

for range in "${user_ranges[@]}"; do
  start_user=$(echo "$range" | cut -d'-' -f1)
  end_user=$(echo "$range" | cut -d'-' -f2)

  start_num=$(echo "$start_user" | grep -oE '[0-9]+')
  end_num=$(echo "$end_user" | grep -oE '[0-9]+')
  prefix=$(echo "$start_user" | grep -oE '[a-zA-Z]+')

  for ((i=$start_num; i<=$end_num; i++)); do
    username="${prefix}${i}"
    bashrc_file="/home/${username}/.bashrc"

    if [ -f "${bashrc_file}" ]; then
      # Check if the alias already exists to avoid duplicates
      if ! grep -q "alias ls='ls --color=auto'" "${bashrc_file}"; then
        # Append the alias command to .bashrc
        echo "Adding alias for user ${username} in ${bashrc_file}"
        sudo sh -c "echo 'alias ls=\"ls --color=auto\"' >> '${bashrc_file}'"
      else
        echo "Alias already exists for user ${username} in ${bashrc_file}, skipping."
      fi
    else
      echo "Warning: .bashrc file not found for user ${username} at ${bashrc_file}. Creating one and adding alias."
      sudo sh -c "echo '# ~/.bashrc - created to enable ls color' > '${bashrc_file}'"
      sudo sh -c "echo 'alias ls=\"ls --color=auto\"' >> '${bashrc_file}'"
    fi
  done
done

echo "Configuration completed. Users need to log out and log back in or source their .bashrc."
