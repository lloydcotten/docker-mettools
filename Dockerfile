FROM debian:jessie

RUN apt-get update \
        && apt-get install -y curl \
        && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/4.2.3.4 main" > /etc/apt/sources.list.d/mono-xamarin.list \
        && apt-get update \
        && apt-get install -y mono-devel ca-certificates-mono nuget \
        && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
        && apt-get install -y libgfortran3 libgomp1 nco grads \
        && rm -rf /var/lib/apt/lists/*

ADD files/usr /