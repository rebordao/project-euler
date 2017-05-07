#define TREE_DATA_TYPE unsigned long long   

// TODO MOVE THOSE IN COMMON.H
typedef int boolean;
#define true 1
#define false 0

#define ull unsigned long long
#define number_of_digits(n) ((ull)round(log10(n)) + 1)

enum number_type {
    TYPE_S, TYPE_I, TYPE_L,
    TYPE_F, TYPE_D, TYPE_LL, TYPE_ULL, TYPE_LD
};

union value {
    short _short;
    int _int;
    long _long;
    float _float;
    double _double;
    long long _long_long;
    unsigned long long _unsigned_long_long;
    long double _long_double;
};

typedef struct node {
    enum number_type type;
    union value value;

    struct node* left;
    struct node* right;
} node;


typedef int (*compare_lower_func)(node * left, node * right);


int ull_compare_lower(node * left, node * right);

node* ull_create_node(ull value) ;

node* insert_node(node *root, node * node, compare_lower_func compare) ;

node* search(node *root, node * node, compare_lower_func compare) ;

void dispose(node* root);