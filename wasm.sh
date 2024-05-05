#!/bin/bash

cp -r resources wasm
cd wasm

emcc \
  -03 \
  -Wall \
  -std=c99 \
  -Wunused-result \
  -Wno-missing-braces \
  -D_DEFAULT_SOURCE \
  -sFULL-ES3=1 \
  -sUSE_GLFW=3 \
  -sASSERTIONS=1 \
  -sMALLOC='dlmalloc' \
  -sFORCE_FILESYSTEM=1 \
  -sUSE_OFFSET_CONVERTER=1 \
  -sGL_ENABLE_GET_PROC_ADDRESS \
  -sEXPORTED_RUNTIME_METHODS=ccall \
  -sABORTING_MALLOC=0 \
  --emrun \
  --embed-file resources@/resources \
  ../zig-out/lib/* \
  -o \
  slingshot.js

 zip -r ../slingshot_wasm.zip .

  # -sASYNCIFY \
  # -sUSE_PTHREADS=1 \
  # -sWASM=0 \
  # --preload-file files/settings.json@/ \
  # -sSAFE_HEAP=1 \
  # -sASYNCIFY_STACK_SIZE=16777216 \
  # -sINITIAL_MEMORY=128MB \
  # -sTOTAL_MEMORY=512MB \
  # -sALLOW_MEMORY_GROWTH=1 \
  # -sALLOW_MEMORY_GROWTH=1 \
  # -sSTACK_SIZE=512MB \
  # -sINITIAL_MEMORY=1024MB \
