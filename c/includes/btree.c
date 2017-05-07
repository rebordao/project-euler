#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <stdint.h>
#include "btree.h"


int ull_compare_lower(node * left, node * right) {
    int result = 0;
    if(left->value._unsigned_long_long > right->value._unsigned_long_long) {
        result = 1;
    }
    if(left->value._unsigned_long_long < right->value._unsigned_long_long) {
        result = -1;
    }
    return result;
}


node * ull_create_node(ull value) {

    node *new_node = (node*) malloc(sizeof(node));

    new_node->type = TYPE_ULL;
    new_node->value._unsigned_long_long = value;
    new_node->left = NULL;
    new_node->right = NULL;

    return new_node;
}

node* insert_node(node *root, node * new_node, compare_lower_func compare) {
 
    if(root == NULL) {
        return root;
    } else {
        int right = 0;
        boolean is_left  = false;

        node * prev = NULL;
        node * current_note = root;
 
        while(current_note != NULL) {
            right = compare(new_node, current_note);
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

        if(is_left) {
            prev->left = new_node;
        } else {
            prev->right = new_node;
        }

        return new_node;
 
    }
}

node* search(node *root, node * new_node, compare_lower_func compare) {
    if(root == NULL){
        return NULL;
    }
 
    int r;
    node* current_note = root;

    while(current_note != NULL) {
        r = compare(new_node, current_note);
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
