# Source code is private. This file shows only its classes and function signatures.

"""Builds the iDrive behaviour reference from the Swift sources.

Live: every constant, type, endpoint, stored setting, message and test comes from the code
each time this runs, with a link to the exact file and line.
Editable: the prose lives in docs/reference/sections/*.md. Edit those freely; this script
never writes them. Write {{Type.member}} to show a constant's current value with its link,
or {{Type}} for a link to a type. Unknown names are listed under "Broken references".

Runs from tools/format/format.sh and as an Xcode build phase, so every change updates it.
Output: docs/reference/iDrive-reference.md (GitLab, relative links with #L) and
docs/reference/iDrive-reference.html (open locally; hover a link to see the source line).
Standard library only.
"""
import datetime
import hashlib
import html
import json
import re
import sys
from pathlib import Path
ROOT = ...
SOURCE_DIRS = ...
TEST_DIRS = ...
OUT = ...
SECTIONS = ...
CATALOG = ...
TYPE_RE = ...
MEMBER_RE = ...
NUMBER_RE = ...
ARRAY_RE = ...
URL_RE = ...
STORAGE_RE = ...
STRING_KEY_RE = ...
SUITE_RE = ...
TEST_RE = ...
MESSAGE_RE = ...
PLACEHOLDER_RE = ...


def swift_files(dirs):
    ...


def strip_code(line, in_block):
    """The line without comments and string contents, for counting braces."""
    ...


def doc_comment(lines, index):
    """The /// lines right above `index`, skipping attribute lines."""
    ...


def first_sentence(text):
    ...


def parse(path):
    ...


def line_of(text, offset):
    ...


def evaluate(value):
    ...


def human(member):
    """The value with a unit where the name, type or comment says which."""
    ...


def load_catalog():
    ...


def catalog_keys(message):
    """Catalogue keys a Swift literal can have: each \\(…) is %@ or %lld."""
    ...


def collect():
    ...


def slug(title):
    """GitLab's heading anchor: lower case, punctuation dropped, spaces to hyphens."""
    ...


def link(entry, data, label=None):
    ...


def cell(text):
    ...


def resolve(text, data, broken):
    ...


def markdown(data):
    ...
STYLE = ...


def inline(text):
    ...


def render_html(md, data):
    ...


def write_if_changed(path, text, stamp):
    """Rewrites only when the content changed, so the timestamp means something."""
    ...


def main():
    ...


if __name__ == '__main__':
    ...
