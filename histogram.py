#!/usr/bin/env python
import sys
import getopt

def usage():
  pass

def process_file(f, bucket_count, min_val, max_val, interval, rng):
  global buckets
  data_count = 0
  for line in f:
    if line[0] == '#': continue
    if line[0] == '\n': continue
    val = float(line.strip())
    if val >= min_val and val <= max_val:
      data_count = data_count + 1
      bucket_number = int((val - min_val)/interval)
      try: buckets[bucket_number] = buckets[bucket_number] + 1
      except IndexError:
        print("Value", val, "bucket", bucket_number, ", bigger than bucket count", bucket_count, file=sys.stderr)
  return data_count

try:
  opts, args = getopt.getopt(sys.argv[1:], "i:r:m:p")
except getopt.GetoptError:
  usage()
  sys.exit(2)

min_val = 0.0
interval = 0.10
rng = 10.0
proportion = False

for o, a in opts:
  if o == '-i':  # bucket interval
    interval = float(a)
  if o == '-r':  # range
    rng = float(a)
  if o == '-m':  # minimum (max = min + range)
    min_val = float(a)
  if o == '-p':  # print proportion in each bucket as well as count
    proportion = True
  
# set up buckets
max_val = min_val + rng
bucket_count = int(rng/interval)
while float(bucket_count)*interval < rng:
  bucket_count = bucket_count + 1

buckets = [0 for x in range(0, bucket_count)]

total_data = 0

# Loop over file(s) full of data points to put in buckets
for a in args:
  try:
    if a != '-': f = open(a, "r")
    else: f = sys.stdin
    cnt = process_file(f, bucket_count, min_val, max_val, interval, rng)
    if cnt == 0:
      print("Found zero lines of data on ", file=sys.stderr, end="")
      if a == '-': print('stdin', file=sys.stderr)
      else: print(a, file=sys.stderr)
    if a != '-': f.close()
    total_data = total_data + cnt
  except (IOError, errno, strerror):
    print('Problem with file "' + a + '":', strerror, file=sys.stderr)

# Print out results
print("# Found", total_data, "lines of data")

if total_data > 0:
  for index, cnt in enumerate(buckets):
    if cnt > 0:
      if proportion:
        print(min_val + interval*index, cnt, float(cnt)/float(total_data))
      else:
        print(min_val + interval*index, cnt)

sys.exit(0)
