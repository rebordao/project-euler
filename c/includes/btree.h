#define TREE_DATA_TYPE unsigned long long   

// TODO MOVE THOSE IN COMMON.H
typedef int boolean;
#define true 1
#define false 0

#define compare_lower(left, right) ({   \
    int result = 0;                     \
    if(left > right) {result = 1;}      \
    if(left < right) {result = -1;}     \
    result;                             \
})                                      \


typedef struct node
{
    TREE_DATA_TYPE data;
    struct node* left;
    struct node* right;
} node;


node* create_node(TREE_DATA_TYPE data) ;

node* insert_node(node *root, TREE_DATA_TYPE data) ;

node* search(node *root,const TREE_DATA_TYPE data) ;

void dispose(node* root);