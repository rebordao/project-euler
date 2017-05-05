#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <stdint.h>
#include "btree.h"

node* create_node(TREE_DATA_TYPE data) {
    node *new_node = (node*) malloc(sizeof(node));

    new_node->data = data;
    new_node->left = NULL;
    new_node->right = NULL;

    return new_node;
}

node* insert_node(node *root, TREE_DATA_TYPE data) {
 
    if(root == NULL) {
        root = create_node(data);
        return root;
    } else {
        TREE_DATA_TYPE right = 0;
        boolean is_left  = false;

        node* prev = NULL;
        node* current_note = root;
 
        while(current_note != NULL) {
            right = compare_lower(data, current_note->data);
            prev = current_note;


            if(right < 0) {
                is_left = true;
                current_note = current_note->left;
            } else if(right > 0) {
                is_left = false;
                current_note = current_note->right;
            } else if (right == 0) {
                return NULL;
            }
 
        }

         node *new_node = create_node(data);

        if(is_left) {
            prev->left = new_node;
        } else {
            prev->right = new_node;
        }

        return new_node;
 
    }
}

node* search(node *root,const TREE_DATA_TYPE data) {
    if(root == NULL){
        return NULL;
    }
 
    TREE_DATA_TYPE r;
    node* current_note = root;

    while(current_note != NULL) {
        r = data < current_note->data;
        if(r < 0) {
            current_note = current_note->left;
        } else if(r > 0) {
            current_note = current_note->right;
        }
        else {
            return current_note;
        }
    }
    return current_note;
}

void dispose(node* root)
{
    if(root != NULL)
    {
        dispose(root->left);
        dispose(root->right);
        free(root);
    }
}

