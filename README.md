# first-custom-action


### Makefile
we will use 'make' to run a series of commands to bui9ld and run the Docker image and execute the entrypoint script a file to necessary; therefore a 'Makefile' is used

### sample_push_event.json
a sample of a push event received by GHA
WE made it similar to what our action will see when it's run, so it's useful for finding out how that data will be formatted
Contains some dummied messages to test the entrypoint script


## content from the course instructor
The instructor named the action Keyword Releaser


# GitHub Action to Create Releases Based on a Keyword
The Keyword Releaser will create a release based on the keyword specified in the arguments.

# Environment Variables
- `GITHUB_TOKEN` - _Required_ Allows the Action to authenticte with the GitHub API to create the release.

# Arguments
- _Required_ - A single keyword.  If the keyword is found in a commit message, a release will be created.  Although case is ignored, it's suggested to use a unique, uppercase string like `FIXED`, `READY_TO_RELEASE`, or maybe even `PINEAPPLE`.

# Examples
Here's an example workflow that uses the Keyword Releaser action.  The workflow is triggered by a `PUSH` event and looks for the keyword `"FIXED"`.

```
name: keyword-releaser

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: ssbpgm/first-custom-action@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        args: 'FIXED'
```

