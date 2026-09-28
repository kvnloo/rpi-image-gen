# Raspberry Pi camera example

This example builds a minimal Raspberry Pi 5 image with the headless camera
applications installed.

The built-in Raspberry Pi boot firmware template already enables
`camera_auto_detect=1`, so supported CSI cameras can be detected without
copying a custom `config.txt`.

Build it with:

```bash
rpi-image-gen build -S ./examples/camera -c pi5-camera.yaml
```

After booting with a camera connected, list detected cameras:

```bash
rpicam-still --list-cameras
```

Capture a still image:

```bash
rpicam-still --output test.jpg
```

The example uses `rpicam-apps-lite`, which provides the camera applications
without pulling in a desktop environment.
