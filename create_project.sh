#!/bin/bash
DATA_PROJECT_PATH="$(pwd)/data/PROJECT.md"
DATA_PROJECT_EXISTS="$(ls data/PROJECT.md)"
if [ -n "$DATA_PROJECT_EXISTS" ]; then
    echo "Project exists, please remove it before creating a new one"
else
    mkdir data
    echo "I am creating a new project. We should define following things:"
    read -p "What is the project? " PROJECT
    echo "$PROJECT" >data/PROJECT.md
fi
DATA_PROJECT="$(cat $DATA_PROJECT_PATH)"
DATA_FRAMEWORK_PATH="$(pwd)/data/FRAMEWORK.md"
DATA_FRAMEWORK_EXISTS="$(ls data/FRAMEWORK.md)"
if [ -n "$DATA_FRAMEWORK_EXISTS" ]; then
    echo "Framework exists, please remove it before creating a new one"
else
    PROMPT="I am creating a new project. $DATA_PROJECT. I am going to choose a framework for this project from the following list: $(ls Software_Development_Frameworks). Which one do you want to choose?"
    echo "$PROMPT"
    echo
    read -p "Which one do you want to choose? " FRAMEWORK
    echo "$FRAMEWORK" >$DATA_FRAMEWORK_PATH
fi
DATA_FRAMEWORK="$(cat $DATA_FRAMEWORK_PATH)"
PROMPT="I am creating a new project. $DATA_PROJECT. The framework for this project is $DATA_FRAMEWORK. Our project is going to have following group of roles: $(ls Software_Development_Frameworks/$DATA_FRAMEWORK/Group_of_Roles/). Which one goes first?"
# echo "$PROMPT"
ORDERED_GROUP_OF_ROLES_PATH="$(pwd)/Software_Development_Frameworks/$DATA_FRAMEWORK/Order_for_Group_of_Roles"
ORDERED_GROUP_OF_ROLES="$(cat $ORDERED_GROUP_OF_ROLES_PATH)"
# echo "$ORDERED_GROUP_OF_ROLES"
ROLES="$(ls Software_Development_Frameworks/$DATA_FRAMEWORK/Group_of_Roles/$ORDERED_GROUP_OF_ROLES)"
# echo "$ROLES"
PROMPT="I am creating a new project. $DATA_PROJECT. The framework for this project is $DATA_FRAMEWORK. Our project is going to have following roles: $ROLES. Which one goes first?"
echo "$PROMPT"
ORDERED_ROLES_PATH="$(pwd)/Software_Development_Frameworks/$DATA_FRAMEWORK/Group_of_Roles/$ORDERED_GROUP_OF_ROLES/Order_for_Roles"
touch $ORDERED_ROLES_PATH
ORDERED_ROLES="$(cat $ORDERED_ROLES_PATH)"
echo "$ORDERED_ROLES"
