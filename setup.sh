#!/bin/sh

PREV_PATH=$(pwd)

VIMDIR=${HOME}/.vim

mkdir -p ${VIMDIR}

cd ${VIMDIR}

ln -sf ${VIMDIR}/vimrc ${HOME}/.vimrc
mkdir -p ${HOME}/.fonts/
ln -sf ${VIMDIR}/fonts/ubuntu-mono-powerline-ttf ${HOME}/.fonts/
fc-cache -fs

cd ${PREV_PATH}
