
#!/bin/bash


arg="$1"
if [ "$arg" == "health" ]; then
    echo '{ "result": "Healthy", "error": false }'
elif [ "$arg" == "who" ]; then
    who_output=$(who)
    echo '{ "result": "'"$who_output"'", "error": false }'
elif [ "$arg" == "create" ]; then
    source ./random.sh
    echo '{ "result": "File created successfully", "error": false }'
elif [ "$arg" == "read" ]; then
    if [ -f "test.txt" ]; then
        file_content=$(cat test.txt)
        echo '{ "result": "'"$file_content"'", "error": false }'
    else
        echo '{ "result": "File not found", "error": true }'
    fi
else
    echo '{ "result": "Invalid argument", "error": true }'
fi

