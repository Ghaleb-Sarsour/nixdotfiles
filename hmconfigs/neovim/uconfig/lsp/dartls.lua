return {
  cmd = { 'dart', 'language-server', '--protocol=lsp' },
  filetypes = { 'dart' },  -- Only attach to Dart files
  root_markers = {'pubspec.yaml'},
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
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
