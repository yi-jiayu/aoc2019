def follow(wire, origin=(0, 0)):
    x, y = origin
    for segment in wire:
        direction = segment[0]
        magnitude = int(segment[1:])
        for _ in range(magnitude):
            if direction == 'U':
                y += 1
            elif direction == 'D':
                y -= 1
            elif direction == 'L':
                x -= 1
            elif direction == 'R':
                x += 1
            else:
                raise ValueError(f'invalid direction: "{direction}"')
            yield x, y


def manhattan_distance(coords):
    x, y = coords
    return abs(x) + abs(y)


if __name__ == '__main__':
    wire1 = input().strip().split(',')
    wire2 = input().strip().split(',')

    wire1_route = set(follow(wire1))
    wire2_route = set(follow(wire2))
    crossings = wire1_route & wire2_route
    print(min(map(manhattan_distance, crossings)))
