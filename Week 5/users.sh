#!/bin/bash

echo "User and Group Administration Script"
echo "1. Add User"
echo "2. Delete User"
echo "3. List Users"
echo "4. Add Group"
echo "5. Delete Group"
echo "6. List Groups"
echo "7. Exit"

read -p "Choose an option: " choice

case $choice in
    1)
        read -p "Enter username to add: " username
        sudo useradd "$username" && echo "User $username added successfully." || echo "Failed to add user."
        ;;
    2)
        read -p "Enter username to delete: " username
        sudo userdel "$username" && echo "User $username deleted successfully." || echo "Failed to delete user."
        ;;
    3)
        echo "Listing all users:"
        cut -d: -f1 /etc/passwd
        ;;
    4)
        read -p "Enter group name to add: " groupname
        sudo groupadd "$groupname" && echo "Group $groupname added successfully." || echo "Failed to add group."
        ;;
    5)
        read -p "Enter group name to delete: " groupname
        sudo groupdel "$groupname" && echo "Group $groupname deleted successfully." || echo "Failed to delete group."
        ;;
    6)
        echo "Listing all groups:"
        cut -d: -f1 /etc/group
        ;;
    7)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid option."
        ;;
esac
