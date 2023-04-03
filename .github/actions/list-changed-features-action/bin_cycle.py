import sys
from itertools import cycle
from typing import List, Any
import fileinput
import json


def cycle_baskets(items: List[Any], maxbaskets: int) -> List[List[Any]]:
    baskets = [[] for _ in range(min(maxbaskets, len(items)))]
    for item, basket in zip(items, cycle(baskets)):
        basket.append(item)
    return baskets

std_input = list(fileinput.input())

binned = cycle_baskets(json.loads(std_input), 10)

sys.stdout.write(json.dumps(binned))