import random

def read_vocabulary(file_path):
    with open(file_path, 'r') as file:
        return file.read().splitlines()

def generate_program_name(words, format_choice):
    random.shuffle(words)
    if format_choice == 1:
        # 2 words
        return ''.join(words[:2])
    elif format_choice == 2:
        # 3 words and a number
        return ''.join(words[:3]) + str(random.randint(0, 999))
    elif format_choice == 3:
        # 2 words and a number
        return ''.join(words[:2]) + str(random.randint(0, 999))
    elif format_choice == 4:
        # 1 word and a number
        return ''.join(words[:1]) + str(random.randint(0, 9999))
    else:
        return "Invalid choice"

def main():
    languages = {'en': 'Words/en.txt', 'de': 'Words/de.txt', 
                 'es': 'Words/es.txt', 'fr': 'Words/fr.txt'}
    
    print("Choose a language:")
    for lang in languages:
        print(f"{lang.upper()} (for {lang})")
    
    language_choice = input("Enter your language choice: ").lower()
    if language_choice not in languages:
        print("Invalid language choice.")
        return
    
    vocabulary_file = languages[language_choice]
    words = read_vocabulary(vocabulary_file)
    
    print("Choose a format for your program name:")
    print("1. Two words")
    print("2. Three words and a number")
    print("3. Two words and a number")
    print("4. One word and a number")
    
    try:
        choice = int(input("Enter your choice (1, 2, or 3): "))
        program_name = generate_program_name(words, choice)
        print("Generated Program Name:", program_name)
    except ValueError:
        print("Invalid format choice.")

if __name__ == "__main__":
    main()
