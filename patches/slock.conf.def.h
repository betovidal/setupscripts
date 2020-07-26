static const char *colorname[NUMCOLS] = {
        [INIT] =   "#000000", /* after initialization */
        [INPUT] =  "#003000", /* during input */
        [FAILED] = "#300000", /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 0;

/* default message */
static const char * message = "Hey you with the pretty face\n\tWelcome to the human race";


/* text size (must be a valid size) */
/* Taken from xfontsel */
static const char * font_name = "-adobe-*-*-r-*-*-34-*-*-*-*-*-*-*";
