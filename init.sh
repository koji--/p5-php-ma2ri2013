#!/bin/sh

carton exec -Ilib -- plackup --access-log=log/access.log >> log/error.log
