#!/bin/bash

# Script to add image shortcodes to blog posts and book reviews
# Usage: ./add_image_shortcodes.sh

echo "Adding image shortcodes to blog posts..."

# Process blog posts
for file in content/english/blog/_posts/*.markdown; do
    if [[ -f "$file" ]]; then
        # Skip if already has image shortcode
        if grep -q "{{< image" "$file"; then
            echo "Skipping $file (already has image shortcode)"
            continue
        fi
        
        # Extract image path from frontmatter
        image_path=$(grep "^image:" "$file" | head -1 | sed 's/image: *//' | tr -d '"')
        
        if [[ -n "$image_path" ]]; then
            # Extract title for alt text
            title=$(grep "^title:" "$file" | head -1 | sed 's/title: *//' | tr -d '"')
            
            # Create the image shortcode
            shortcode="{{< image src=\"$image_path\" caption=\"\" alt=\"$title\" height=\"\" width=\"\" position=\"center\" command=\"fill\" option=\"q100\" class=\"img-fluid\" title=\"$title\"  webp=\"true\"  >}}"
            
            # Find the line after the frontmatter closing ---
            temp_file=$(mktemp)
            awk -v shortcode="$shortcode" '
            /^---$/ && NR > 1 && !found_closing {
                found_closing = 1
                print $0
                print ""
                print shortcode
                print ""
                next
            }
            { print }
            ' "$file" > "$temp_file"
            
            mv "$temp_file" "$file"
            echo "Added image shortcode to: $file"
        else
            echo "No image path found in: $file"
        fi
    fi
done

echo ""
echo "Adding image shortcodes to book reviews..."

# Process book reviews
for file in content/english/book_reviews/review-*.md; do
    if [[ -f "$file" ]]; then
        # Skip if already has image shortcode
        if grep -q "{{< image" "$file"; then
            echo "Skipping $file (already has image shortcode)"
            continue
        fi
        
        # Extract image path from frontmatter
        image_path=$(grep "^image:" "$file" | head -1 | sed 's/image: *//' | tr -d '"')
        
        if [[ -n "$image_path" ]]; then
            # Extract title for alt text
            title=$(grep "^title:" "$file" | head -1 | sed 's/title: *//' | tr -d '"')
            
            # Create the image shortcode
            shortcode="{{< image src=\"$image_path\" caption=\"\" alt=\"$title\" height=\"\" width=\"\" position=\"center\" command=\"fill\" option=\"q100\" class=\"img-fluid\" title=\"$title\"  webp=\"true\"  >}}"
            
            # Find the line after the frontmatter closing ---
            temp_file=$(mktemp)
            awk -v shortcode="$shortcode" '
            /^---$/ && NR > 1 && !found_closing {
                found_closing = 1
                print $0
                print ""
                print shortcode
                print ""
                next
            }
            { print }
            ' "$file" > "$temp_file"
            
            mv "$temp_file" "$file"
            echo "Added image shortcode to: $file"
        else
            echo "No image path found in: $file"
        fi
    fi
done

echo ""
echo "Script completed!"
echo "Image shortcodes have been added to all eligible files."
