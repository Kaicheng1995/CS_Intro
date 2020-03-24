// Implements a dictionary's functionality

#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>

#include <stdlib.h>
#include <string.h>

#include "dictionary.h"

// Represents number of buckets in a hash table
#define N 26

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
}
node;

// Represents a hash table
node *hashtable[N];

// Hashes word to a number between 0 and 25, inclusive, based on its first letter
unsigned int hash(const char *word)
{
    return tolower(word[0]) - 'a';
}

// Loads dictionary into memory, returning true if successful else false
bool load(const char *dictionary)
{
    // Initialize hash table
    for (int i = 0; i < N; i++)
    {
        hashtable[i] = NULL;
    }

    // Open dictionary
    FILE *file = fopen(dictionary, "r");
    if (file == NULL)
    {
        unload();
        return false;
    }

    // Buffer for a word
    char word[LENGTH + 1];


    unsigned int word_count = 0;

    // Insert words into hash table
    while (fscanf(file, "%s", word) != EOF)
    {
        node *new_node = malloc(sizeof(node));

        if(new_node == NULL)
        {
            unload();
            return false;
        }
        else
        strcpy(new_node -> word, word);
        word_count++;

        int index = hash(word);
        if (hashtable[index])
        {
            new_node->next = hashtable[index];
            hashtable[index] = new_node;
        }
        else
        {
            hashtable[index] = new_node;
            new_node->next = NULL;
        }
    }

    // Close dictionary
    fclose(file);

    // Indicate success
    return true;
}



// Returns number of words in dictionary if loaded else 0 if not yet loaded
unsigned int size(void)
{
    if (word_count>0)
    {
        return word_count;
    }
    else
    {
        return 0;
    }
}




// Returns true if word is in dictionary else false
bool check(const char *word)
{
    int len = strlen(word);
    char word_copy[len + 1];

    for (int i = 0; i < len; i++)
    {
       word_copy[i] = tolower(word[i]);
    }

    word_copy[len] = '\0';

    int h = hash(word_copy);

    node* cursor = hashtable[h];

    while (cursor != NULL)
    {
        if (strcmp(cursor->word, word_copy) == 0)
        {
            return true;
        }
        else
        {
            cursor = cursor->next;
        }
    }
    return false;
}


// Unloads dictionary from memory, returning true if successful else false
bool unload(void)
{
    for (int i = 0; i < N; i++)
    {
        node* cursor = hashtable[i];
        while (cursor != NULL)
        {
            node* temp = cursor;
            cursor = cursor->next;
            free(temp);
        }
    }
    return true;
}
