# How to use this image

## Create a Dockerfile in your elm working directory

```
FROM srobertson/elm
CMD [ "python", "./your-daemon-or-script.py" ]
```

There are several ONBUILD triggers that will copy your `elm-package.json` to /usr/src/app along with the rest 
of your app, retrevie dependencies with elm-package and build with elm-make.

You can then build and run the Docker image:

docker build -t my-python-app .
docker run -it --rm --name my-running-app my-elm-app



