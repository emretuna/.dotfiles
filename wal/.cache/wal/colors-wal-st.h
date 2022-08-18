const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#091110", /* black   */
  [1] = "#335765", /* red     */
  [2] = "#4F4C4F", /* green   */
  [3] = "#685B56", /* yellow  */
  [4] = "#47636B", /* blue    */
  [5] = "#C3743F", /* magenta */
  [6] = "#99674F", /* cyan    */
  [7] = "#e7c79e", /* white   */

  /* 8 bright colors */
  [8]  = "#a18b6e",  /* black   */
  [9]  = "#335765",  /* red     */
  [10] = "#4F4C4F", /* green   */
  [11] = "#685B56", /* yellow  */
  [12] = "#47636B", /* blue    */
  [13] = "#C3743F", /* magenta */
  [14] = "#99674F", /* cyan    */
  [15] = "#e7c79e", /* white   */

  /* special colors */
  [256] = "#091110", /* background */
  [257] = "#e7c79e", /* foreground */
  [258] = "#e7c79e",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
