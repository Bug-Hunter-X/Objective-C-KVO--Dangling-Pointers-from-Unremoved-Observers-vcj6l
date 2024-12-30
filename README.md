# Objective-C KVO: Dangling Pointers from Unremoved Observers

This repository demonstrates a common yet subtle bug in Objective-C related to Key-Value Observing (KVO) and memory management.  Failing to remove observers from observed objects before the objects are deallocated can lead to dangling pointers and application crashes.

## Bug Description
The bug arises when an observer is added using `addObserver:forKeyPath:options:context:` but is never removed using `removeObserver:forKeyPath:`. When the observed object is deallocated, the observer may still attempt to access it, causing a crash.

## How to Reproduce
1. Clone this repository.
2. Compile and run the `bug.m` file.
3. Observe the unexpected behavior or crash.

## Solution
The solution is to always remove the observer using `removeObserver:forKeyPath:` when it's no longer needed, typically in the observer's `dealloc` method or when the observation is no longer required.
The `bugSolution.m` file demonstrates the corrected code.