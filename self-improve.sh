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
    mkdir "Software_Development_Frameworks/$FRAMEWORK/Group_of_Roles"
    GROUP_ROLES="$(ls Software_Development_Frameworks/$FRAMEWORK/Group_of_Roles)"
    # echo "$GROUP_ROLES"
    for GROUP_ROLE in $GROUP_ROLES; do
        echo "List roles in $GROUP_ROLE"
    done
done
