#!/bin/bash
set -e

rm -f /app/tmp/pids/server.pid

/app/bin/rails db:create
/app/bin/rails db:migrate
/app/bin/rails s -p 3000 -b '0.0.0.0'
