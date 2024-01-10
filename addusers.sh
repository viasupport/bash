#!/bin/bash
#Create 10 users with random passwords Ver1.1

# New User Setup Script

counter=10

for ((i = 0; i < $counter; i++))
do

#Random USERNAME
  # Generate random letters (choose the length according to your need)
  RANDOM_LETTERS=$(tr -dc 'a-z' </dev/urandom | head -c 5) # 5 random lowercase letters
  # Generate random numbers (choose the length according to your need)
  RANDOM_NUMBERS=$(tr -dc '0-9' </dev/urandom | head -c 3) # 3 random digits
  # Combine letters and numbers to form username
  RANDOM_USERNAME="${RANDOM_LETTERS}${RANDOM_NUMBERS}"

#Random USERNAME_PASSWORD
  RANDOM_USERNAME_PASSWORD=$(tr -dc A-Za-z0-9! < /dev/urandom | head -c 16) #16 random digits, simbols, letters 

  useradd -r -M $RANDOM_USERNAME
  echo "$RANDOM_USERNAME:$RANDOM_USERNAME_PASSWORD" | sudo chpasswd
  echo "User $RANDOM_USERNAME created successfully. Default password is $RANDOM_USERNAME_PASSWORD."
done

echo "Setup completed."
