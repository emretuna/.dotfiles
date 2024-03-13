return {
  "rafamadriz/friendly-snippets",
  opts = {
    require("luasnip").filetype_extend("typescript", { "tsdoc" }),
    require("luasnip").filetype_extend("javascript", { "jsdoc" }),
    require("luasnip").filetype_extend("php", { "phpdoc" }),
  },
}
