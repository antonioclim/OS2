for user in $(getent passwd | awk -F: '$1 ~ /^stud/ {print $1}'); do
    echo "$user:stud" | sudo chpasswd
done
