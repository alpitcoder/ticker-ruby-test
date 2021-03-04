# README

First Problem.

 1. If you have to support 100x the volume of data what would you change in the architecture, schema etc ?
  Solution:
  
  I will have mongodb as a database as it is document store database and readability is fast in that case. We can also apply indexing if it required on stock symbol field. And if tsv has so much data then i will upload the file using sidekiq as a background job so that UI won't hamper much. I can also use caching to cache data on symbol and daily/hourly basis.
  
 2. How will you support realtime ingestion of a data feed of ticker data ?
  Solution:
  
  I will create websocket for this so that realtime interaction could be possible. Also since inserting data in real time need to be faster, I will use redis as a in-memore database to first store data there and then will sync those data to my mongodb database to make writing faster.
 
