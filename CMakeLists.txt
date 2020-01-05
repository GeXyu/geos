cmake_minimum_required(VERSION 3.15)
project(os C)

set(CMAKE_C_STANDARD 99)

add_library(os library.c library.h)