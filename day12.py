from dataclasses import dataclass
from itertools import product


@dataclass
class Vec3D:
    x: int
    y: int
    z: int

    def __add__(self, other):
        return Vec3D(self.x + other.x, self.y + other.y, self.z + other.z)


@dataclass
class Moon:
    position: Vec3D
    velocity: Vec3D
    name: str = ''

    @property
    def potential_energy(self):
        return abs(self.position.x) + abs(self.position.y) + abs(self.position.z)

    @property
    def kinetic_energy(self):
        return abs(self.velocity.x) + abs(self.velocity.y) + abs(self.velocity.z)

    @property
    def total_energy(self):
        return self.potential_energy * self.kinetic_energy


def apply_gravity(moons):
    for i, first in enumerate(moons):
        for j, second in enumerate(moons[i + 1:]):
            for axis in 'xyz':
                a = getattr(first.position, axis)
                b = getattr(second.position, axis)
                if a > b:
                    delta = -1
                elif a < b:
                    delta = 1
                else:
                    delta = 0
                setattr(first.velocity, axis, getattr(first.velocity, axis) + delta)
                setattr(second.velocity, axis, getattr(second.velocity, axis) - delta)


def apply_velocity(moons):
    for moon in moons:
        moon.position += moon.velocity


if __name__ == '__main__':
    moons = [
        # Moon(Vec3D(-1, 0, 2), Vec3D(0, 0, 0), name='Io'),
        # Moon(Vec3D(2, -10, -7), Vec3D(0, 0, 0), name='Europa'),
        # Moon(Vec3D(4, -8, 8), Vec3D(0, 0, 0), name='Ganymede'),
        # Moon(Vec3D(3, 5, -1), Vec3D(0, 0, 0), name='Callisto'),
        Moon(Vec3D(-19, -4, 2), Vec3D(0, 0, 0), name='Io'),
        Moon(Vec3D(-9, 8, -16), Vec3D(0, 0, 0), name='Europa'),
        Moon(Vec3D(-4, 5, -11), Vec3D(0, 0, 0), name='Ganymede'),
        Moon(Vec3D(1, 9, -13), Vec3D(0, 0, 0), name='Callisto'),
    ]
    for t in range(1000):
        apply_gravity(moons)
        apply_velocity(moons)
    print(sum(moon.total_energy for moon in moons))
