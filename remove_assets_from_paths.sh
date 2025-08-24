#!/bin/bash

# Script to remove "assets" from image source paths
# This will change paths like "assets/images/..." to "images/..."

echo "Updating image paths in blog posts..."

# Process blog posts
for file in content/english/blog/_posts/*.markdown; do
    if [[ -f "$file" ]]; then
        # Check if file has image paths with "assets"
        if grep -q "assets/images" "$file"; then
            # Create backup
            cp "$file" "${file}.backup"
            
            # Remove "assets/" from frontmatter image paths
            sed -i 's|image: assets/|image: |g' "$file"
            
            # Remove "assets/" from image shortcode src paths
            sed -i 's|src="assets/|src="|g' "$file"
            
            echo "Updated image paths in: $file"
        else
            echo "No assets paths found in: $file"
        fi
    fi
done

echo ""
echo "Updating image paths in book reviews..."

# Process book reviews
for file in content/english/book_reviews/*.md; do
    if [[ -f "$file" ]]; then
        # Check if file has image paths with "assets"
        if grep -q "assets/images" "$file"; then
            # Create backup
            cp "$file" "${file}.backup"
            
            # Remove "assets/" from frontmatter image paths
            sed -i 's|image: assets/|image: |g' "$file"
            
            # Remove "assets/" from image shortcode src paths
            sed -i 's|src="assets/|src="|g' "$file"
            
            echo "Updated image paths in: $file"
        else
            echo "No assets paths found in: $file"
        fi
    fi
done

echo ""
echo "Script completed!"
echo "All 'assets/' prefixes have been removed from image paths."
echo "Backup files (.backup) have been created for modified files."
