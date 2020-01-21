#!/bin/sh

echo "Started"
curl -XPOST "https://api.github.com/repos/$GITHUB_REPO/statuses/$GITHUB_SHA" \
  -h "Authorization: Bearer $GITHUB_TOKEN" \
  -h "Content-Type: application/json" \
  -d '{"state": "pending", "context": "foo"}'
sleep 10
curl -XPOST "https://api.github.com/repos/$GITHUB_REPO/statuses/$GITHUB_SHA" \
  -h "Authorization: Bearer $GITHUB_TOKEN" \
  -h "Content-Type: application/json" \
  -d '{"state": "success", "context": "foo"}'
echo "Ended"
