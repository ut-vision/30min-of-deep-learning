from PIL import Image


def resize_image(image: Image.Image, size: tuple[int, int]) -> Image.Image:
    """
    Resize an image to the specified size.

    Args:
        image (Image.Image): The image to resize.
        size (tuple): The desired size as a tuple (width, height).

    Returns:
        Image.Image: The resized image.
    """
    return image.resize(size, Image.Resampling.LANCZOS)
