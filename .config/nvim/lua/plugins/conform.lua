return {
  "stevearc/conform.nvim",
  opts = {},
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    vim.g.autoformat = false

    conform.setup({
      formatters_by_ft = {
        css = { "prettier" },
        elm = { "elm_format" },
        graphql = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier" },
        perl = { "perl-debug-adapter_formatter" },
        python = { "ruff_fix", "ruff_format" },
        rust = { "rustfmt" },
        svelte = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        yaml = { "prettier" },
      },

      formatters = {
        perl_debug_adapter_formatter = {
          -- fonction qui retourne la commande et les options pour exécuter le formateur
          format = function(ctx)
            -- ctx.content: table des lignes ; ctx.path: chemin du fichier
            -- adapter qui invoque perl-debug-adapter en mode format (adapter selon l'outil)
            return {
              -- exécutable de l'adapter (ajustez le nom si différent)
              exe = "perl-debug-adapter",
              -- exemple d'arguments ; ajustez selon l'API réelle
              args = { "--format", ctx.path },
              -- true si l'outil lit depuis stdin
              stdin = false,
              cwd = vim.fn.fnamemodify(ctx.path, ":h"),
            }
          end,
          -- optionnel : détecter si l'outil est disponible
          condition = function()
            return vim.fn.executable("perl-debug-adapter") == 1
          end,
        },
      },

      format_on_save = function(bufnr)
        if vim.g.autoformat then
          return { lsp_fallback = true, async = false, timeout_ms = 1000 }
        end
      end,
    })

    vim.api.nvim_create_user_command("FormatOnSave", function()
      vim.g.autoformat = not vim.g.autoformat
      vim.notify("Autoformat on save: " .. tostring(vim.g.autoformat))
    end, {})

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_format = "fallback",
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
