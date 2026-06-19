return {
  "romus204/tree-sitter-manager.nvim",
  dependencies = {}, -- La ligne de commande tree-sitter doit être installée sur votre système
  config = function()
    require("tree-sitter-manager").setup({
      -- Options par défaut
      ensure_installed = {
        "bash",
        "dockerfile",
        "gitignore",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "perl",
        "php",
        "python",
        "rst",
        "rust",
        "typescript",
        "vim",
        "yaml",
      }, -- la liste de tous les parsers à installer au démarrage de la session neovim. La valeur "all", installe tous les parsers.
      auto_install = true, -- installe les parsers manquant lors de l’édition d’un fichier
    })
  end,
}

