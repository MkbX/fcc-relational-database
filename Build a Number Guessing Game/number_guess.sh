#!/bin/bash

# Database connection
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Get username
echo -e "\nEnter your username:\n"
read USERNAME

# Username in database ?
USERNAME_QUERY=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME';")
# No
if [[ -z $USERNAME_QUERY ]]
then
USERNAME_INSERT=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME');")
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';")
echo "$USER_ID"
echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
# Yes
else
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';")
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID;")
BEST_GAME=$($PSQL "SELECT MIN(guess_count) FROM games WHERE user_id = $USER_ID;")
echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
# Game start
echo -e "\nGuess the secret number between 1 and 1000:\n"
SECRET_NUMBER=$(($RANDOM % 1000 +1))
NUMBER_OF_GUESSESS=0
# Main loop
while [[ $USER_GUESS != $SECRET_NUMBER ]]
do
read USER_GUESS
NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
then
echo -e "\nThat is not an integer, guess again:\n"
elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
then
echo -e "\nIt's lower than that, guess again:\n"
elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
then
echo -e "\nIt's higher than that, guess again:\n"
fi
done
# End
echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
INSERTION_RESULT=$($PSQL "INSERT INTO games(user_id, secret_number, guess_count) VALUES ($USER_ID, $SECRET_NUMBER, $NUMBER_OF_GUESSES);")