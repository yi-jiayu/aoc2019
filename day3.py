from dataclasses import dataclass


@dataclass(frozen=True)
class Vec2D:
    i: int
    j: int

    def __add__(self, other):
        return Vec2D(self.i + other.i, self.j + other.j)


def follow(wire, origin=Vec2D(0, 0)):
    p = origin
    for segment in wire:
        direction = segment[0]
        magnitude = int(segment[1:])
        if direction == 'U':
            delta = Vec2D(0, 1)
        elif direction == 'D':
            delta = Vec2D(0, -1)
        elif direction == 'L':
            delta = Vec2D(-1, 0)
        elif direction == 'R':
            delta = Vec2D(1, 0)
        else:
            raise ValueError(f'invalid direction: "{direction}"')
        for _ in range(magnitude):
            p = p + delta
            yield p


def manhattan_distance_from_origin(p: Vec2D):
    return abs(p.i) + abs(p.j)


if __name__ == '__main__':
    wire1 = input().strip().split(',')
    wire2 = input().strip().split(',')

    wire1_route = set(follow(wire1))
    wire2_route = set(follow(wire2))
    crossings = wire1_route & wire2_route
    print(min(map(manhattan_distance_from_origin, crossings)))
