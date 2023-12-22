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
FRAMEWORK_PATH="$(pwd)/Software_Development_Frameworks/$DATA_FRAMEWORK"

ORDERED_GROUP_OF_ROLES_PATH="$FRAMEWORK_PATH/Order_for_Group_of_Roles"
ORDERED_GROUP_OF_ROLES="$(cat $ORDERED_GROUP_OF_ROLES_PATH)"
echo "$FRAMEWORK_PATH"
for GROUP_OF_ROLES in $ORDERED_GROUP_OF_ROLES; do
    GROUP_OF_ROLES_PATH="$FRAMEWORK_PATH/Group_of_Roles/$GROUP_OF_ROLES"
    ROLES="$(ls $GROUP_OF_ROLES_PATH | tr '\n' ' ')"
    PROMPT="I am creating a new project. $DATA_PROJECT. The framework for this project is $DATA_FRAMEWORK. Our $GROUP_OF_ROLES has following roles: $ROLES. Which one goes first?"
    # echo "$PROMPT"
    ORDERED_ROLES_PATH="$GROUP_OF_ROLES_PATH/Order_for_Roles"
    touch $ORDERED_ROLES_PATH
    ORDERED_ROLES="$(cat $ORDERED_ROLES_PATH | tr '\n' ' ')"
    # echo "$ORDERED_ROLES"
    for ROLE in $ORDERED_ROLES; do
        echo
        # echo "$ROLE"
        PROMPT="I am working on a project. $DATA_PROJECT. The framework for this project is $DATA_FRAMEWORK. Our $GROUP_OF_ROLES has following roles: $ROLES. I am working on $ROLE. What should I do?"
        echo "$PROMPT"
        WHAT_SHOULD_I_DO_PATH="$GROUP_OF_ROLES_PATH/$ROLE/What_should_I_do.md"
        touch $WHAT_SHOULD_I_DO_PATH
        ACTIVITIES_PATH="$GROUP_OF_ROLES_PATH/$ROLE/Activities"
        mkdir $ACTIVITIES_PATH
        ACTIVITIES="$(cat "$GROUP_OF_ROLES_PATH/$ROLE/ACTIVITIES" | tr '\n' ' ')"
        for ACTIVITY in $ACTIVITIES; do
            echo
            ACTIVITY_PATH="$ACTIVITIES_PATH/$ACTIVITY"
            mkdir $ACTIVITY_PATH
            touch "$ACTIVITY_PATH/WHAT_YOU_NEED_TO_KNOW"
            touch "$ACTIVITY_PATH/WHAT_YOU_NEED_TO_KNOW.md"
            PROMPT="I am working on a project. $DATA_PROJECT. Our $GROUP_OF_ROLES has following roles: $ROLES. You are acting as $ROLE, $ACTIVITY. What information do you need?"
            echo "$PROMPT" | sed 's/_/ /g'
            # 
            WHAT_YOU_NEED_TO_KNOW_PATH="$ACTIVITY_PATH/WHAT_YOU_NEED_TO_KNOW"
            WHAT_YOU_NEED_TO_KNOW="$(cat $WHAT_YOU_NEED_TO_KNOW_PATH)"
            for WHAT_YOU_NEED_TO_KNOW_ITEM in $WHAT_YOU_NEED_TO_KNOW; do
                WHAT_YOU_NEED_TO_KNOW_ITEM_PATH="$ACTIVITY_PATH/$WHAT_YOU_NEED_TO_KNOW_ITEM"
                PROMPT="I am working on a project. $DATA_PROJECT. Our $GROUP_OF_ROLES has following roles: $ROLES. You are acting as $ROLE, $ACTIVITY. What are potential $WHAT_YOU_NEED_TO_KNOW_ITEM for this?"
                echo "$PROMPT" | sed 's/_/ /g'
            done
        done
    done
done
