SELECT id, 'name', md5(cast(rand() as string)), 'name2'
      ,md5(cast(rand() as string))
      ,md5(cast(rand() as string))
      ,current_date() - INTERVAL (cast(rand() as int) * 100) DAY
      ,current_date() - (cast(rand() as int) * 100 + 100) DAY
FROM unnest(generate_array(1,100)) id;