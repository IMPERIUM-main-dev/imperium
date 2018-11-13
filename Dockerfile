FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev

RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:bitcoin/bitcoin

RUN apt-get update

RUN apt-get install -y libdb4.8-dev libdb4.8++-dev

RUN apt-get install -y libminiupnpc-dev

RUN apt-get install -y libzmq3-dev

RUN apt-get install -y git

RUN git clone https://github.com/IMPERIUM-main-dev/imperium

WORKDIR /imperium

RUN ./autogen.sh

RUN ./configure --without-gui --disable-tests --disable-bench

RUN make

RUN make install

RUN mkdir /root/.imperium

RUN cp imperium.conf /root/.imperium/imperium.conf

EXPOSE 9629 9630
