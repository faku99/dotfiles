-- First read our docs (completely) then check the example_config repo

local M = {}

M.plugins = require('custom.plugins');
M.ui = {
  hl_override = require('custom.highlights'),
  theme = "oceanic-next",
};

return M
