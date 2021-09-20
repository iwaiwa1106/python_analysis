FROM python:3
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN apt-get install -y vim less

#mecabの追加
RUN apt install mecab libmecab-dev mecab-ipadic-utf8 git make curl xz-utils file swig -y
RUN apt-get install mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8
RUN cp /etc/mecabrc /usr/local/etc/

#フォントの追加
RUN apt install fonts-noto-cjk

RUN pip install --upgrade pip
RUN pip install --upgrade setuptools

#AIモデル構築に使用する各種ライブラリ追加
RUN python -m pip install jupyterlab
RUN python -m pip install firebase_admin
RUN python -m pip install pandas
RUN python -m pip install numpy
RUN python -m pip install requests
RUN python -m pip install bs4
RUN python -m pip install geopy
RUN python -m pip install lxml
RUN python -m pip install mecab-python3
RUN python -m pip install sklearn
RUN python -m pip install xgboost
RUN python -m pip install matplotlib
RUN python -m pip install seaborn
