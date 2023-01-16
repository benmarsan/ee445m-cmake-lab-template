# vscode-debug-run.cmake
# This cmake script just runs vscode_debug. This is necessary to generate the vscode debug scripts
# at compile time since cmake doesn't know which target is being built at configure time.

file(MAKE_DIRECTORY "${VSCODE_DIR}")
configure_file(
    "${PROJ_ROOT_DIR}/cmake/vscode-debug.in"
    "${VSCODE_DIR}/launch.json"
    @ONLY
)
