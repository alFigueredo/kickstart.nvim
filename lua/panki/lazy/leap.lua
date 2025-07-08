return {
  'ggandor/leap.nvim',
  dependencies = { 'tpope/vim-repeat' },
  opts = function()
    require('leap').set_default_mappings()
  end,
}
