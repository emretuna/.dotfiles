const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1d2731", /* black   */
  [1] = "#C18E78", /* red     */
  [2] = "#596C86", /* green   */
  [3] = "#6A748D", /* yellow  */
  [4] = "#8C7987", /* blue    */
  [5] = "#A27E82", /* magenta */
  [6] = "#7187A1", /* cyan    */
  [7] = "#c7bbbe", /* white   */

  /* 8 bright colors */
  [8]  = "#8b8285",  /* black   */
  [9]  = "#C18E78",  /* red     */
  [10] = "#596C86", /* green   */
  [11] = "#6A748D", /* yellow  */
  [12] = "#8C7987", /* blue    */
  [13] = "#A27E82", /* magenta */
  [14] = "#7187A1", /* cyan    */
  [15] = "#c7bbbe", /* white   */

  /* special colors */
  [256] = "#1d2731", /* background */
  [257] = "#c7bbbe", /* foreground */
  [258] = "#c7bbbe",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
