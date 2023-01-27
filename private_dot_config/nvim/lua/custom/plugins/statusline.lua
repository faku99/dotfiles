-- local st_modules = require('nvchad_ui.statusline.modules')

local sep_style = vim.g.statusline_sep_style
local separators = (type(sep_style) == "table" and sep_style)
    or require("nvchad_ui.icons").statusline_separators[sep_style]
local sep_l = separators["left"]
local sep_r = separators["right"]

local modes = {
  ["n"] = { "NORMAL", "St_NormalMode" },
  ["niI"] = { "NORMAL i", "St_NormalMode" },
  ["niR"] = { "NORMAL r", "St_NormalMode" },
  ["niV"] = { "NORMAL v", "St_NormalMode" },
  ["no"] = { "N-PENDING", "St_NormalMode" },
  ["i"] = { "INSERT", "St_InsertMode" },
  ["ic"] = { "INSERT (completion)", "St_InsertMode" },
  ["ix"] = { "INSERT completion", "St_InsertMode" },
  ["t"] = { "TERMINAL", "St_TerminalMode" },
  ["nt"] = { "NTERMINAL", "St_NTerminalMode" },
  ["v"] = { "VISUAL", "St_VisualMode" },
  ["V"] = { "V-LINE", "St_VisualMode" },
  ["Vs"] = { "V-LINE (Ctrl O)", "St_VisualMode" },
  [""] = { "V-BLOCK", "St_VisualMode" },
  ["R"] = { "REPLACE", "St_ReplaceMode" },
  ["Rv"] = { "V-REPLACE", "St_ReplaceMode" },
  ["s"] = { "SELECT", "St_SelectMode" },
  ["S"] = { "S-LINE", "St_SelectMode" },
  [""] = { "S-BLOCK", "St_SelectMode" },
  ["c"] = { "COMMAND", "St_CommandMode" },
  ["cv"] = { "COMMAND", "St_CommandMode" },
  ["ce"] = { "COMMAND", "St_CommandMode" },
  ["r"] = { "PROMPT", "St_ConfirmMode" },
  ["rm"] = { "MORE", "St_ConfirmMode" },
  ["r?"] = { "CONFIRM", "St_ConfirmMode" },
  ["!"] = { "SHELL", "St_TerminalMode" },
}

return {
    mode = function()
        local m = vim.api.nvim_get_mode().mode
        local current_mode = "%#" .. modes[m][2] .. "#" .. " " .. modes[m][1]
        local sep = "%#" .. modes[m][2] .. "Sep" .. "#" .. sep_r

        return current_mode .. sep
    end,

    fileInfo = function()
        local filename = (vim.fn.expand("%") == "" and "Empty")
        if (filename ~= "Empty") then
            filename = (vim.o.columns > 85 and vim.fn.expand("%:p")) or vim.fn.expand("%:t")
        end

        return "%#St_file_sep#" .. sep_l .. "%#St_file_info#" .. filename .. "%#St_file_sep#" .. sep_r
    end,

    LSP_Diagnostics = function()
        if (not rawget(vim, "lsp")) then
            return ""
        end

        local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

        local errors_str = (errors and (errors > 0)) and ("%#St_lspError#" .. "" .. errors .. " ") or ""
        local warnings_str = (warnings and (warnings > 0)) and ("%#St_lspWarning#" .. "" .. warnings .. " ") or ""
        local hints_str = (hints and (hints > 0)) and ("%#St_lspHint#" .. "" .. hints .. " ") or ""
        local info_str = (info and (info > 0)) and ("%#St_lspInfo#" .. "" .. info .. " ") or ""

        return errors_str .. warnings_str .. hints_str .. info_str
    end,

    LSP_status = function()
        if (rawget(vim, "lsp")) then
            for _, client in ipairs(vim.lsp.get_active_clients()) do
                if (client.attached_buffers[vim.api.nvim_get_current_buf()]) then
                    return "  "
                end
            end
        end
    end,

    cwd = function()
        return ""
    end,

    git = function()
        if (not vim.b.gitsigns_head or vim.b.gitsigns_git_status) then
            return ""
        end

        local git_status = vim.b.gitsigns_status_dict
        local added = (git_status.added and git_status.added ~= 0) and (" +" .. git_status.added) or ""
        local changed = (git_status.changed and git_status.changed ~= 0) and (" ~" .. git_status.changed) or ""
        local removed = (git_status.removed and git_status.removed ~= 0) and (" -" .. git_status.removed) or ""
        local branch = git_status.head

        return "%#St_gitIcons# " .. branch .. added .. changed .. removed .. " %#St_file_info#"
    end,

    cursor_position = function()
        local current_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        local text = math.modf((current_line / total_lines) * 100) .. tostring("%%")

        return "%#St_pos_text#" .. " " .. text .. " "
    end,
}

