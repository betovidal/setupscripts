static const char *colorname[NUMCOLS] = {
        [INIT] =   "#000000", /* after initialization */
        [INPUT] =  "#003000", /* during input */
        [FAILED] = "#300000", /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 0;
