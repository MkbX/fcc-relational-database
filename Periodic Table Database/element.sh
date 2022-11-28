#!/bin/bash

# Database connection variable
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# If no arg from ./element.sh arg
if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
else
# Read arg from ./element.sh arg
if [[ $1 =~ ^[0-9]+$ ]]
then
ARG_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1;")
else
ARG_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol = '$1';")
ARG_NAME=$($PSQL "SELECT name FROM elements WHERE name = '$1';")
fi

# Arg in database ?
if [[ -n $ARG_ATOMIC_NUMBER ]]
then
ATOMIC_NUMBER_RESULT=$ARG_ATOMIC_NUMBER
ATOMIC_NUMBER_FOR_QUERY=$ATOMIC_NUMBER_RESULT
elif [[ -n $ARG_SYMBOL ]]
then
ATOMIC_NUMBER_RESULT=$ARG_SYMBOL
#echo ".$ATOMIC_NUMBER_RESULT."  | sed -E 's/\s//g'
ATOMIC_NUMBER_FOR_QUERY=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$(echo "$ATOMIC_NUMBER_RESULT"  | sed -E 's/\s//g')';")
elif [[ -n $ARG_NAME ]]
then
ATOMIC_NUMBER_RESULT=$ARG_NAME
ATOMIC_NUMBER_FOR_QUERY=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$(echo "$ATOMIC_NUMBER_RESULT"  | sed -E 's/\s//g')';")
else
ATOMIC_NUMBER_RESULT="I could not find that element in the database."
fi

if [[ $ATOMIC_NUMBER_RESULT == "I could not find that element in the database." ]]
then
echo $ATOMIC_NUMBER_RESULT
else
SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER_FOR_QUERY;")
NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER_FOR_QUERY;")
TYPE=$($PSQL "SELECT type FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE elements.atomic_number = $ATOMIC_NUMBER_FOR_QUERY;")
ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER_FOR_QUERY;")
MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER_FOR_QUERY;")
BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER_FOR_QUERY;")
echo "The element with atomic number $(echo "$ATOMIC_NUMBER_FOR_QUERY"  | sed -E 's/\s//g') is $(echo "$NAME"  | sed -E 's/\s//g') ($(echo "$SYMBOL"  | sed -E 's/\s//g')). It's a $(echo "$TYPE"  | sed -E 's/\s//g'), with a mass of $(echo "$ATOMIC_MASS"  | sed -E 's/\s//g') amu. $(echo "$NAME"  | sed -E 's/\s//g') has a melting point of $(echo "$MELTING_POINT"  | sed -E 's/\s//g') celsius and a boiling point of $(echo "$BOILING_POINT"  | sed -E 's/\s//g') celsius."
fi
fi