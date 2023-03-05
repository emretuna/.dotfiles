const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0F0F10", /* black   */
  [1] = "#714437", /* red     */
  [2] = "#4E3D42", /* green   */
  [3] = "#684B4C", /* yellow  */
  [4] = "#995131", /* blue    */
  [5] = "#AC633F", /* magenta */
  [6] = "#E19727", /* cyan    */
  [7] = "#e8be9e", /* white   */

  /* 8 bright colors */
  [8]  = "#a2856e",  /* black   */
  [9]  = "#714437",  /* red     */
  [10] = "#4E3D42", /* green   */
  [11] = "#684B4C", /* yellow  */
  [12] = "#995131", /* blue    */
  [13] = "#AC633F", /* magenta */
  [14] = "#E19727", /* cyan    */
  [15] = "#e8be9e", /* white   */

  /* special colors */
  [256] = "#0F0F10", /* background */
  [257] = "#e8be9e", /* foreground */
  [258] = "#e8be9e",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
