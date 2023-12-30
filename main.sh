#!/bin/bash

read_vocabulary() {
    local file_path=$1
    mapfile -t words < "$file_path"
}

generate_program_name() {
    local format_choice=$1
    local word_count
    local program_name=""

    case $format_choice in
        1) word_count=2 ;;
        2) word_count=3 ;;
        3) word_count=2 ;;
        4) word_count=1 ;;
        *) echo "Invalid choice"; exit 1 ;;
    esac

    for (( i=0; i<word_count; i++ )); do
        local random_index=$((RANDOM % ${#words[@]}))
        program_name+="${words[$random_index]}"
    done

    if [[ $format_choice == 2 || $format_choice == 3 || $format_choice == 4 ]]; then
        local random_number=$((RANDOM % 1000))
        program_name+="${random_number}"
    fi

    echo "$program_name"
}

main() {
    echo "Choose a language:"
    echo "EN (for English)"
    echo "DE (for German)"
    echo "ES (for Spanish)"
    echo "FR (for French)"

    read -p "Enter your language choice: " language_choice
    case $language_choice in
        EN) vocabulary_file="Words/en.txt" ;;
        DE) vocabulary_file="Words/de.txt" ;;
        ES) vocabulary_file="Words/es.txt" ;;
        FR) vocabulary_file="Words/fr.txt" ;;
        *) echo "Invalid language choice."; exit 1 ;;
    esac

    read_vocabulary "$vocabulary_file"

    echo "Choose a format for your program name:"
    echo "1. Two words"
    echo "2. Three words and a number"
    echo "3. Two words and a number"
    echo "4. One word and a number"

    read -p "Enter your choice (1, 2, 3, or 4): " choice
    program_name=$(generate_program_name "$choice")
    echo "Generated Program Name: $program_name"
}

main
