#!/bin/bash

create_user() {
    USERNAME=$1
    PASSWORD=$2
    GROUP=$3

    # Check if user already exists
    if id "$USERNAME" &>/dev/null;
    then
        echo "User '$USERNAME' already exists. Skipping..."
        return
    fi

    # Check if group exists, if not create it
    if ! getent group "$GROUP" >/dev/null; then
        groupadd "$GROUP"
    fi

    # Create user
    useradd -m -g "$GROUP" "$USERNAME"

    # Set password
    echo "$USERNAME:$PASSWORD" | chpasswd

    echo "User '$USERNAME' created successfully!"
}

# USER 1
create_user "demo01" "Demo@123" "grp1"

# USER 2
create_user "demo02" "Demo@123" "grp2"

# USER 3
create_user "demo03" "Demo@123" "grp3"

echo "Process completed!"

