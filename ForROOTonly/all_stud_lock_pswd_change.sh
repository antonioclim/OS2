for user in $(getent passwd | awk -F: '$1 ~ /^stud/ {print $1}'); do
    sudo passwd -n 99999 -x 99999 -w 99999 $user
done
