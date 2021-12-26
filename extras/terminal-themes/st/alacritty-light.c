/*
* Terminal colors (16 first used in escape sequence)
* Template taken from spacecamp
*/
static const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#313449", /* black   */
  [1] = "#C34864", /* red     */
  [2] = "#7D9685", /* green   */
  [3] = "#DE956F", /* yellow  */
  [4] = "#6A8CBC", /* blue    */
  [5] = "#8787BF", /* magenta */
  [6] = "#829FB0", /* cyan    */
  [7] = "#D5D4E0", /* white   */

  /* 8 bright colors */
  [8]  = "#414560", /* black   */
  [9]  = "#B7435E", /* red     */
  [10] = "#7e8f80", /* green   */
  [11] = "#D88B72", /* yellow  */
  [12] = "#6E7EBF", /* blue    */
  [13] = "#7170C2", /* magenta */
  [14] = "#728A9A", /* cyan    */
  [15] = "#CCCBD9", /* white   */

  /* special colors */
  [256] = "#E6E6F1", /* background */
  [257] = "#708190", /* foreground */
};

/*
 * Default colors (colorname index)
 * foreground, background, cursor
 */
static unsigned int defaultfg = 257;
static unsigned int defaultbg = 256;
static unsigned int defaultcs = 257;

/*
 * Colors used, when the specific fg == defaultfg. So in reverse mode this
 * will reverse too. Another logic would only make the simple feature too
 * complex.
 */
static unsigned int defaultitalic = 7;
static unsigned int defaultunderline = 7;

