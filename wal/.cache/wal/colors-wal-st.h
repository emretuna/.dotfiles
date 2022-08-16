const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000916", /* black   */
  [1] = "#92907B", /* red     */
  [2] = "#EBAD76", /* green   */
  [3] = "#A99F8B", /* yellow  */
  [4] = "#D7B799", /* blue    */
  [5] = "#E1C2B3", /* magenta */
  [6] = "#EFC6B2", /* cyan    */
  [7] = "#e6dad7", /* white   */

  /* 8 bright colors */
  [8]  = "#a19896",  /* black   */
  [9]  = "#92907B",  /* red     */
  [10] = "#EBAD76", /* green   */
  [11] = "#A99F8B", /* yellow  */
  [12] = "#D7B799", /* blue    */
  [13] = "#E1C2B3", /* magenta */
  [14] = "#EFC6B2", /* cyan    */
  [15] = "#e6dad7", /* white   */

  /* special colors */
  [256] = "#000916", /* background */
  [257] = "#e6dad7", /* foreground */
  [258] = "#e6dad7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
