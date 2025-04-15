return {
  name = 'dartls',
  cmd = { 'dart', 'language-server', '--protocol=lsp' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'pubspec.yaml' }, { upward = true })[1]),
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = false,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
      analysisExcludedFolders = { vim.fn.expand("~/.pub-cache") },
    },
    flutter = {
      showOutline = true,
    }
  },
}
