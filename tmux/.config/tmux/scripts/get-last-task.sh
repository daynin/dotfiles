#!/bin/bash

if task &> /dev/null;
then
  last_task=$(task _get 1.description)

  printf "#[fg=#a6d189,bold,bg=#303446]   #[fg=#c6d0f5,bold,bg=#303446]${last_task}  "
fi
