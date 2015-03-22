FROM haskell:7.8
RUN apt-get update && apt-get install -y git
RUN cabal update 

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/

RUN git clone https://github.com/elm-lang/elm-platform.git
RUN cd elm-platform/installers && runhaskell BuildFromSource.hs master
ENV PATH $PATH:/usr/serc/elm-platform/installers/Elm-Platform/master/bin


WORKDIR /usr/src/app

ONBUILD COPY elm-package.json /usr/src/app/
ONBUILD RUN elm-package 

ONBUILD COPY . /usr/src/app