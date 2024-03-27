# write_to_gha_env: write a key-value pair out to the github actions environment
# variables
write_to_gha_env <- function(key, value) {
  system2("echo", c(
    paste0(key, "=", value),
    ">>",
    "$GITHUB_ENV"))
}
