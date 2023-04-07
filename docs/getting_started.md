# Getting Started

To get started first [fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) the [repository](https://github.com/mathlingua/mathlore-content) that contains the Mathlore content.  This is the community's collection of mathematical content written in the Mathlingua language.

Next, download the latest release of the Mathlingua command line tool from the [releases page](https://github.com/mathlingua/mathlingua/releases), rename it to `mlg`, and ensure it is in your `PATH`.

Last, you can use whatever editor you like to edit Mathlingua code.  However, if you use [Visual Studio Code](https://code.visualstudio.com/) you can [install](https://code.visualstudio.com/docs/editor/extension-marketplace#_install-an-extension) the [Mathlingua Language Support](https://marketplace.visualstudio.com/items?itemName=dominickramer.mathlingua-language-support) extension that provides syntax highlighting, autocompletion, and error diagnostics provided by `mlg`.

> Mathlingua files have the `.math` extension and the `mathlingua-language-support` extension is designed to analyze any files with the `.math` extension.

## Using the Mathlingua Tooling Manually

The `mlg` tool uses the format `mlg <command>` where `<command>` is an action to perform:

* `mlg check`:  Analyzes all `.math` files in the current working directory recursively for any errors and prints them to the screen.  Optionally, if directory or `.math` file name(s) are specified, only errors for those files are printed to the screen.
* `mlg view`: Serves the current directory's Mathlingua files at `http://localhost:8080` so that they can be viewed.
* `mlg version`: Prints the Mathlingua version.
* `mlg help`: Prints information about how to use `mlg`.
