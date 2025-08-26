# stm32cube-coppeliasim
Single Docker Image with Python, CoppeliaSim and STM32Cube IDE for a certain competition.

```bash
    podman run --rm -it \
      -v /run/user/$(id -u)/:/run/user/$(id -u)/ \
      -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
      -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
      --ipc=host \
      ghcr.io/sounddrill31/stm32cube-coppeliasim:latest  \
      coppeliasim
```

```bash
    podman run --rm -it \
      -v /run/user/$(id -u)/:/run/user/$(id -u)/ \
      -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
      -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
      --ipc=host \
      ghcr.io/sounddrill31/stm32cube-coppeliasim:latest  \
      stm32cubeide
```