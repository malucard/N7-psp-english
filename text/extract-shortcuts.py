#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import re


def main():

  path = sys.argv[1] if len(sys.argv) > 1 else "SHORTCUT.SCN"
  txtpath = sys.argv[2] if len(sys.argv) > 2 else path + ".jp.txt"
  mode = sys.argv[3] if len(sys.argv) > 3 else "shortcut"

  if mode == "append": # the lazy way
    text_tables = [0x0, 0x6c8]
    text = [0x6c8, 0xe99]
  else:
    text_tables = [0x0, 0xde4]
    text = [0xde4, 0x2eca]

  f=open(path, "rb")
  data_bytes = f.read()
  f.close()

  f = open(txtpath, "wb")

  int_view = memoryview(data_bytes).cast("I").tolist()

  pattern = re.compile(b"([^\x00]*)\x00")
  for match in pattern.finditer(data_bytes[text[0]:text[1]]):
    st = match.group(1)
    size = match.end(1) - match.start(1)
    offset = match.start(1) + text[0]
    int_table_offset = int_view.index(offset, text_tables[0], text_tables[1] // 4)
    while int_view[int_table_offset-1] != 0: # the lazy way x2
      try:
        int_table_offset = int_view.index(offset, int_table_offset+1, text_tables[1] // 4)
      except ValueError:
        break
    table_offset = int_table_offset * 4
    f.write(b";%X;%d;%s\n\n"%(table_offset, size, st))
  
  f.close()
  # for s in strings0 + strings1 + strings2:
  #   if s != b'':
  #     f.write(b';;' + b"%d"%(len(s)|3,) + b';' + s + b'\n\n')
  # f.close()


if __name__ == '__main__':
  main();
