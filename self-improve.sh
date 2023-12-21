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
    PROMPT_ROLES="List roles of $FRAMEWORK"
    echo "$PROMPT_ROLES" > "Software_Development_Frameworks/$FRAMEWORK/PROMPT_ROLES.md"
    touch "Software_Development_Frameworks/$FRAMEWORK/ROLES.md"
done
