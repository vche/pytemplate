import sys

import TEMPLATE_PACKAGE_NAME


def hello(version: str) -> str:
    """Build the hello string.

    Args:
        version (str): Version string
    Returns:
        str: string built
    """
    return f"TEMPLATE_PACKAGE_NAME version {TEMPLATE_PACKAGE_NAME.__version__}"


def main() -> None:
    """Main entry point."""
    hello_str = hello(TEMPLATE_PACKAGE_NAME.__version__)
    print(f" {hello_str} {sys.argv}")
