# C++ Driver Development and Reverse Engineering Setup

This repository contains a PowerShell script to set up a development environment for C++ driver development and reverse engineering on a Windows 11 machine. It installs Visual Studio Build Tools, the Windows Driver Kit (WDK), Ghidra, IDA Free, and other essential tools and dependencies.

## Prerequisites

Ensure you have the following:
- A Windows 11 machine
- Administrator privileges to install software

## Tools Installed

- Visual Studio 2022 Build Tools with C++ Desktop Development and Windows Driver Kit (WDK)
- OpenJDK 11
- CMake
- Ninja build system
- Git
- Python
- Ghidra
- IDA Free

## Installation

### Step 1: Manual Download

1. Download the latest Ghidra release from the [Ghidra Releases Page](https://ghidra-sre.org).
2. Place the downloaded Ghidra zip file in your `Downloads` folder (or update the script with the correct path).

### Step 2: Run the PowerShell Script

Open PowerShell as an Administrator and run the following script to install all the tools:
