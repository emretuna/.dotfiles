const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#06090E", /* black   */
  [1] = "#185EAD", /* red     */
  [2] = "#5D5E96", /* green   */
  [3] = "#A06A92", /* yellow  */
  [4] = "#D16E8B", /* blue    */
  [5] = "#2187D4", /* magenta */
  [6] = "#6699F0", /* cyan    */
  [7] = "#ddc1cb", /* white   */

  /* 8 bright colors */
  [8]  = "#9a878e",  /* black   */
  [9]  = "#185EAD",  /* red     */
  [10] = "#5D5E96", /* green   */
  [11] = "#A06A92", /* yellow  */
  [12] = "#D16E8B", /* blue    */
  [13] = "#2187D4", /* magenta */
  [14] = "#6699F0", /* cyan    */
  [15] = "#ddc1cb", /* white   */

  /* special colors */
  [256] = "#06090E", /* background */
  [257] = "#ddc1cb", /* foreground */
  [258] = "#ddc1cb",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
