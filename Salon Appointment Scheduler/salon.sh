#!/bin/bash

# Query variable
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# Welcome message.
echo -e "\n3 ███                        3 ███\n3 █▄▄ 'Welcome to 3-S Salon' 3 █▄▄\n3 ▄▄█                        3 ▄▄█"
echo -e "\n -- Choose a service --\n"

MAIN_MENU(){

  # If MAIN_MENU has an argument, write it.
  if [[ ! -z $1 ]]
  then
  echo -e "$1"
  fi
  
  # Menu selection.
  echo -e "1) Trendy haircut for women"
  echo -e "2) Classic undercut for men"
  echo -e "3) Free haircut for disabled children"

  # Get service from user and book if available, show MAIN_MENU otherwise.
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
  1) BOOK_MENU;;
  2) BOOK_MENU;;
  3) BOOK_MENU;;
  *) MAIN_MENU "\n Please choose a number between 1 and 3.\n";;
  esac

}


BOOK_MENU() {

  # Get phone from user.
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # Phone in database ?
  CUSTOMER_PHONE_SELECT_RESULT=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  # No, phone not in database.
  if [[ -z $CUSTOMER_PHONE_SELECT_RESULT ]]
  then
  echo -e "\nWe don't have a record for that phone number, what's your name?"
  # Get name from user and insert it with phone in database.
  read CUSTOMER_NAME
  CUSTOMER_DATA_INSERT_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
  # Yes, phone in database, get customer name from it.
  else
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  fi
  # Get customer ID and service name from database.
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
  # Get appointment time from user.
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  # Insert appointment in database.  
  APPOINTMENT_INSERT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
  # Confirmation message.
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

}


MAIN_MENU