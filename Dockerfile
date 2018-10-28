FROM ubuntu:18.04

RUN apt-get update

RUN apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev

RUN apt-get install software-properties-common

RUN add-apt-repository ppa:bitcoin/bitcoin

RUN apt-get update

RUN apt-get install libdb4.8-dev libdb4.8++-dev

RUN apt-get install libminiupnpc-dev

RUN apt-get install libzmq3-dev

RUN apt-get install git

RUN git clone https://github.com/IMPERIUM-main-dev/imperium

RUN cd imperium

RUN ./autogen.sh

RUN ./configure --without-gui --disable-tests --disable-bench

RUN make

RUN make install

RUN mkdir /root/.imperium

RUN cp imperium.conf /root/.imperium/imperium.conf

EXPOSE 9780 9781

CMD ["imperiumd", "--printtoconsole"]