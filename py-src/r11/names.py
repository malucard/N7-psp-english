#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import collections

TlNames = collections.namedtuple("TlNames", ["en", "cn"])
# key - original japanese name
# value - list of translated values [en, cn]
names_dict = {
  "？？": TlNames("??", "？？"),
  
  "誠": TlNames("Makoto", ""),
  "優夏": TlNames("Yuka", ""),
  "億彦": TlNames("Okuhiko", ""),
  "遙": TlNames("Haruka", ""),
  "いづみ": TlNames("Izumi", ""),
  "くるみ": TlNames("Kurumi", ""),
  "沙紀": TlNames("Saki", ""),
  "医者": TlNames("Doctor", ""),
  "みんな": TlNames("Everyone", ""),
  "漁師": TlNames("Fisherman", ""),
  "声": TlNames("Announcer", ""),
  "運転手": TlNames("Driver", ""),
  "守野姉妹": TlNames("Morino sisters", ""),
  "男の子": TlNames("Boy", ""),
  "女の子": TlNames("Girl", ""),
  "先輩": TlNames("Senpai", ""),
  "警官の声": TlNames("Police officer", ""),
  "警備員": TlNames("Security guard", ""),
  "看護師": TlNames("Nurse", ""),
  "店員": TlNames("Clerk", ""),
  "老人": TlNames("Old person", ""),
  "店長": TlNames("Manager", ""),
  "父": TlNames("Father", ""),
  "半魚人": TlNames("Merman", ""),
  "謎の声": TlNames("Mysterious voice", ""),
  "サメ子": TlNames("Shark", ""),
  "ラプラス": TlNames("Laplace", ""),
  "ときみ": TlNames("Tokimi", ""),
  "北大路": TlNames("Kitaoji", ""),
  "女の声": TlNames("Female voice", ""),
  "男の声": TlNames("Male voice", ""),
  "少年の声": TlNames("Boy's voice", ""),
  "新入生": TlNames("Freshman", ""),
  "上級生": TlNames("Senior", ""),
  "青年": TlNames("Kid", ""),
  "教授": TlNames("Professor", ""),
  "ふたり": TlNames("Couple", ""),
  "漁師の客": TlNames("Fisherman client", ""),
  "客": TlNames("Customer", ""),
  "母親": TlNames("Mother", ""),
  "ゆえ": TlNames("Yue", ""),
  "不審人物": TlNames("Suspicious person", ""),
  "誠＆優夏": TlNames("Makoto & Yuka", ""),
  "誠＆くるみ": TlNames("Makoto & Kurumi", ""),
  "優夏＆億彦": TlNames("Yuka & Okuhiko", ""),
  "島民Ａ": TlNames("Islander A", ""),
  "いづみ以外": TlNames("Everyone but Izumi", ""),
  "サメの意識": TlNames("Shark's Consciousness", ""),
  "人影": TlNames("Silhouette", ""),
  "やさ男": TlNames("Kind Man", ""),
  "キザな男": TlNames("Pretentious Man", ""),
  
  "こころ": TlNames("Kokoro", "心"),
  "悟": TlNames("Satoru", "悟"),
  "黛": TlNames("Mayuzumi", "黛"),
  "黄泉木": TlNames("Yomogi", "黄泉木"),
  "内海": TlNames("Utsumi", "内海"),
  "犬伏": TlNames("Inubushi", "犬伏"),
  "ゆに": TlNames("Yuni", "悠尼"),
  "穂鳥": TlNames("Hotori", "穗鸟"),
  "榎本": TlNames("Enomoto", "鼷本"),
  "男": TlNames("Man", "男"),
  "女": TlNames("Woman", "女"),
  "少年": TlNames("Boy", "男孩"),
  "少女": TlNames("Girl", "女孩"),
  "機長": TlNames("Pilot", "机长"),
  "みんな": TlNames("Everyone", "所有人"),
  # "Yukidoh", rather than "Yuukidou", because it is written everywhere else this way
  "ユウキドウ": TlNames("Yukidoh", "优希堂"),
  # These occur in init.bin only, but pasting them here, for reference
  "山岳救助隊員": TlNames("Mountain rescue worker", ";unused"),
  "沙也香": TlNames("Sayaka", ";unused"),
}

ja_original_separator = "・" # "\u30fb"
en_separator = ","
cn_separator = "、"

separators = TlNames(en_separator, cn_separator)

# tl_lang should be one of TlNames field names: "en" or "cn"
def translateNamesString(character_names: str, tl_lang: str) -> str:
  if not character_names:
    return ""
  
  jp_names = character_names.split(ja_original_separator)
  # print(jp_names, file=sys.stderr)
  translated_names = [names_dict.get(jp_name)._asdict()[tl_lang] for jp_name in jp_names]
  if (None in translated_names):
    raise Exception("Speaker translation for %s not found. Values: %s"%(character_names, translated_names))
  translated_names_joined = separators._asdict()[tl_lang].join(translated_names)
  return translated_names_joined
  
