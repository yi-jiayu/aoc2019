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


def follow2(wire, origin=(0, 0)):
    x, y = origin
    distance = 0
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
            distance += 1
            yield (x, y), distance


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

    wire1_route_with_distances = list(follow2(wire1))
    wire2_route_with_distances = list(follow2(wire2))

    wire1_distances = {}
    for coords, distance in wire1_route_with_distances:
        if coords not in wire1_distances:
            wire1_distances[coords] = distance

    wire2_distances = {}
    for coords, distance in wire2_route_with_distances:
        if coords not in wire2_distances:
            wire2_distances[coords] = distance


    def combined_steps_to_coord(coord):
        return wire1_distances[coord] + wire2_distances[coord]


    print(min(map(combined_steps_to_coord, crossings)))
