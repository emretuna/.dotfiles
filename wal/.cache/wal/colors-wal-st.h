const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a070c", /* black   */
  [1] = "#293568", /* red     */
  [2] = "#47394F", /* green   */
  [3] = "#55454F", /* yellow  */
  [4] = "#5B4F62", /* blue    */
  [5] = "#996249", /* magenta */
  [6] = "#37559C", /* cyan    */
  [7] = "#a1a9c5", /* white   */

  /* 8 bright colors */
  [8]  = "#707689",  /* black   */
  [9]  = "#293568",  /* red     */
  [10] = "#47394F", /* green   */
  [11] = "#55454F", /* yellow  */
  [12] = "#5B4F62", /* blue    */
  [13] = "#996249", /* magenta */
  [14] = "#37559C", /* cyan    */
  [15] = "#a1a9c5", /* white   */

  /* special colors */
  [256] = "#0a070c", /* background */
  [257] = "#a1a9c5", /* foreground */
  [258] = "#a1a9c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
