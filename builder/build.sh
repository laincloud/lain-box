#!/bin/bash -

time vagrant up
vagrant halt
time vagrant package --output lain-box-$(date +%s).box default
