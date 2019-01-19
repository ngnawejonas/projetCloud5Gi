#!/bin/bash

for i in `seq 1 20`;
do
	sh countwords.sh input $(($i*32))
done

