import sys
from collections import defaultdict, deque

children = defaultdict(set)
neighbours = defaultdict(set)

for line in sys.stdin:
    parent, child = line.strip().split(')')
    children[parent].add(child)
    neighbours[parent].add(child)
    neighbours[child].add(parent)

root = 'COM'
depths = {root: 0}
queue = deque([root])

while queue:
    curr = queue.popleft()
    current_depth = depths[curr]
    for child in children[curr]:
        depths[child] = current_depth + 1
        queue.append(child)

print(sum(depths.values()))

origin = 'YOU'
dest = 'SAN'
queue = deque([(origin, 0)])
visited = set()

while queue:
    curr, distance = queue.popleft()
    visited.add(curr)
    if curr == dest:
        print(distance - 2)
        break
    for neighbour in neighbours[curr] - visited:
        queue.append((neighbour, distance + 1))
