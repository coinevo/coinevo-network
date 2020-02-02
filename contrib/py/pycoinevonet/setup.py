from setuptools import setup, find_packages



setup(
  name="pycoinevonet",
  version="0.0.1",
  license="ZLIB",
  author="jeff",
  author_email="jeff@i2p.rocks",
  description="coinevonet python bindings",
  url="https://github.com/coinevo/coinevo-network",
  install_requires=["pysodium", "requests", "python-dateutil"],
  packages=find_packages())