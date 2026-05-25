#!/bin/bash

echo "================================="
echo "GitHub Actions Test Started"
echo "================================="

echo "Current Date:"
date

echo ""
echo "Current User:"
whoami

echo ""
echo "Current Path:"
pwd

echo ""
echo "Listing Files:"
ls -la

echo ""
echo "Creating Output Folder..."
mkdir -p output

echo "GitHub Actions is working successfully!" > output/result.txt

echo ""
echo "Output Files:"
ls -la output

echo ""
echo "Test Script Completed Successfully"
