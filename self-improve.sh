ORIGINAL_PROMPT_PATH="$(pwd)/ORIGINAL_PROMPT.md"
PROMPT="I am creating a new project"
PROMPT="$PROMPT. $(cat $ORIGINAL_PROMPT_PATH)"
PROMPT_DIRECTORIES="$PROMPT. Let suggest directories of this project"
echo "$PROMPT_DIRECTORIES"

PROMPT_FRAMEWORKS="Suggests comprehensive frameworks for scaling software development framework across large organizations"
echo "$PROMPT_FRAMEWORKS"

EXISTS_SOFTWARE_DEVELOPMENT_FRAMEWORKS="$(ls Software_Development_Frameworks)"
for FRAMEWORK in $EXISTS_SOFTWARE_DEVELOPMENT_FRAMEWORKS
do
    echo
    PROMPT_GROUP_OF_ROLES="List group of roles in $FRAMEWORK"
    echo "$PROMPT_GROUP_OF_ROLES" > "Software_Development_Frameworks/$FRAMEWORK/PROMPT_GROUP_OF_ROLES.md"
    touch "Software_Development_Frameworks/$FRAMEWORK/GROUP_ROLES.md"
    GROUP_OF_ROLES_PATH="Software_Development_Frameworks/$FRAMEWORK/Group_of_Roles"
    mkdir "$GROUP_OF_ROLES_PATH"
    touch "Software_Development_Frameworks/$FRAMEWORK/Order_for_Group_of_Roles"
    GROUP_ROLES="$(ls $GROUP_OF_ROLES_PATH)"
    # echo "$GROUP_ROLES"
    for GROUP_ROLE in $GROUP_ROLES; do
        echo "List roles in $GROUP_ROLE of $FRAMEWORK"
        ROLES="$(ls $GROUP_OF_ROLES_PATH/$GROUP_ROLE)"
        for ROLE in $ROLES; do
            echo "$ROLE"
            PROMPT_ACTIVITIES="List activities in $ROLE of $GROUP_ROLE in $FRAMEWORK"
            echo $PROMPT_ACTIVITIES > "$GROUP_OF_ROLES_PATH/$GROUP_ROLE/$ROLE/PROMPT_ACTIVITIES.md"
            touch "$GROUP_OF_ROLES_PATH/$GROUP_ROLE/$ROLE/ACTIVITIES.md"
        done
    done
done
