## Docker commands

#### Q - What are the useful docker commands?

- Build a docker image from dockerfile - `docker build -t kdncrabbitmq -f Dockerfile .`
- Start docker instance from image - `docker run -d -p 15672:15672 -p 5672:5672 kdncrabbitmq`
