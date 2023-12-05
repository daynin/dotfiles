  if task &> /dev/null;
  then
    tasks_count=$(task status:pending count)

    printf "#[fg=#e5c890,bold,bg=#303446]  $tasks_count"
  fi
