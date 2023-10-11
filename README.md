# first-custom-action


### Makefile
we will use 'make' to run a series of commands to bui9ld and run the Docker image and execute the entrypoint script a file to necessary; therefore a 'Makefile' is used

### sample_push_event.json
a sample of a push event received by GHA
WE made it similar to what our action will see when it's run, so it's useful for finding out how that data will be formatted
Contains some dummied messages to test the entrypoint script

